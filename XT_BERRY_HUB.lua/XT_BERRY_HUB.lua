-- XT BERRY HUB - Roblox Studio UI starter
-- Place this LocalScript in StarterPlayer > StarterPlayerScripts
-- This creates a blue-themed hub interface for YOUR OWN Roblox experience.
-- It does not exploit or modify Blox Fruits or unlock another game's Premium features.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Remove an older copy when testing in Studio
local oldGui = playerGui:FindFirstChild("XTBerryHub")
if oldGui then
	oldGui:Destroy()
end

local COLORS = {
	Background = Color3.fromRGB(10, 17, 31),
	Panel = Color3.fromRGB(16, 28, 48),
	Panel2 = Color3.fromRGB(21, 39, 65),
	Blue = Color3.fromRGB(35, 145, 255),
	BlueDark = Color3.fromRGB(20, 95, 190),
	Text = Color3.fromRGB(235, 244, 255),
	Muted = Color3.fromRGB(145, 166, 193),
	Green = Color3.fromRGB(55, 205, 140),
	Off = Color3.fromRGB(65, 82, 105),
	Stroke = Color3.fromRGB(43, 75, 112),
}

local tabs = {
	"Main", "Farming", "Level Farm", "Mastery", "Fruit", "Material",
	"Boss", "Raid", "Sea Events", "Mirage Island", "Race V2-V4",
	"Dojo", "Prehistoric", "Leviathan", "Fighting Style", "Sword",
	"Gun", "ESP", "Teleport", "Shop", "PvP", "Misc", "Settings"
}

-- These are interface demo controls. Connect them only to mechanics in your own game.
local controls = {
	["Main"] = {
		{type = "label", name = "Welcome to XT BERRY", desc = "Blue edition • Studio UI starter"},
		{type = "button", name = "Show hub information", desc = "Displays a short information message."},
		{type = "toggle", name = "Enable interface effects", desc = "Turns small visual effects on or off."},
	},
	["Farming"] = {
		{type = "toggle", name = "Auto collect (demo)", desc = "Example toggle; no farming is performed."},
		{type = "toggle", name = "Nearby item indicator", desc = "Example toggle for your own game."},
		{type = "button", name = "Refresh indicators", desc = "Example action button."},
	},
	["Level Farm"] = {
		{type = "toggle", name = "Show level progress", desc = "Example progress display toggle."},
		{type = "button", name = "Reset demo progress", desc = "Resets only this UI's demo counter."},
	},
	["Mastery"] = {
		{type = "toggle", name = "Show mastery tracker", desc = "Example tracker toggle."},
	},
	["Fruit"] = {
		{type = "toggle", name = "Show fruit tracker", desc = "Example tracker toggle."},
		{type = "button", name = "Refresh fruit list", desc = "Example action button."},
	},
	["Material"] = {
		{type = "toggle", name = "Show material tracker", desc = "Example tracker toggle."},
	},
	["Boss"] = {
		{type = "toggle", name = "Boss alert (demo)", desc = "Example alert toggle."},
	},
	["Raid"] = {
		{type = "toggle", name = "Raid status panel", desc = "Example status toggle."},
	},
	["Sea Events"] = {
		{type = "toggle", name = "Sea event alerts (demo)", desc = "Example alert toggle."},
	},
	["Mirage Island"] = {
		{type = "toggle", name = "Island alert (demo)", desc = "Example alert toggle."},
	},
	["Race V2-V4"] = {
		{type = "toggle", name = "Race progress tracker", desc = "Example tracker toggle."},
	},
	["Dojo"] = {
		{type = "toggle", name = "Dojo task checklist", desc = "Example checklist toggle."},
	},
	["Prehistoric"] = {
		{type = "toggle", name = "Prehistoric event alert", desc = "Example alert toggle."},
	},
	["Leviathan"] = {
		{type = "toggle", name = "Leviathan status alert", desc = "Example alert toggle."},
	},
	["Fighting Style"] = {
		{type = "toggle", name = "Style progress tracker", desc = "Example tracker toggle."},
	},
	["Sword"] = {
		{type = "toggle", name = "Sword collection tracker", desc = "Example tracker toggle."},
	},
	["Gun"] = {
		{type = "toggle", name = "Gun collection tracker", desc = "Example tracker toggle."},
	},
	["ESP"] = {
		{type = "toggle", name = "Friendly teammate markers", desc = "For teammates in your own experience only."},
	},
	["Teleport"] = {
		{type = "button", name = "Return to spawn (demo)", desc = "Connect this to your own game's spawn system."},
	},
	["Shop"] = {
		{type = "button", name = "Open your game's shop", desc = "Example button; connect your own shop UI."},
	},
	["PvP"] = {
		{type = "toggle", name = "PvP status panel", desc = "Example status toggle."},
	},
	["Misc"] = {
		{type = "toggle", name = "Compact mode", desc = "Changes the panel spacing."},
		{type = "button", name = "Reset interface", desc = "Rebuilds the interface on next run."},
	},
	["Settings"] = {
		{type = "toggle", name = "Remember UI position", desc = "Keeps the window position while this session runs."},
		{type = "button", name = "Close XT BERRY", desc = "Closes this interface."},
	},
}

local gui = Instance.new("ScreenGui")
gui.Name = "XTBerryHub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(720, 465)
main.Position = UDim2.new(0.5, -360, 0.5, -232)
main.BackgroundColor3 = COLORS.Background
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = COLORS.Stroke
mainStroke.Thickness = 1.3
mainStroke.Parent = main

local top = Instance.new("Frame")
top.Name = "TopBar"
top.Size = UDim2.new(1, 0, 0, 48)
top.BackgroundColor3 = COLORS.Panel
top.BorderSizePixel = 0
top.Parent = main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 12)
topCorner.Parent = top

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(17, 0)
title.Size = UDim2.new(1, -110, 1, 0)
title.Font = Enum.Font.GothamBold
title.Text = "XT BERRY HUB"
title.TextColor3 = COLORS.Text
title.TextSize = 19
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = top

local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.AnchorPoint = Vector2.new(1, 0.5)
subtitle.Position = UDim2.new(1, -52, 0.5, 0)
subtitle.Size = UDim2.fromOffset(115, 20)
subtitle.Font = Enum.Font.Gotham
subtitle.Text = "BLUE EDITION"
subtitle.TextColor3 = COLORS.Muted
subtitle.TextSize = 10
subtitle.Parent = top

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(32, 30)
close.Position = UDim2.new(1, -40, 0, 9)
close.BackgroundColor3 = Color3.fromRGB(160, 55, 70)
close.Text = "×"
close.TextColor3 = COLORS.Text
close.TextSize = 22
close.Font = Enum.Font.GothamBold
close.AutoButtonColor = true
close.Parent = top
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Position = UDim2.fromOffset(10, 58)
sidebar.Size = UDim2.new(0, 166, 1, -68)
sidebar.BackgroundColor3 = COLORS.Panel
sidebar.BorderSizePixel = 0
sidebar.Parent = main
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 9)

local tabScroll = Instance.new("ScrollingFrame")
tabScroll.Name = "Tabs"
tabScroll.Position = UDim2.fromOffset(7, 8)
tabScroll.Size = UDim2.new(1, -14, 1, -16)
tabScroll.BackgroundTransparency = 1
tabScroll.BorderSizePixel = 0
tabScroll.ScrollBarThickness = 3
tabScroll.ScrollBarImageColor3 = COLORS.Blue
tabScroll.CanvasSize = UDim2.new()
tabScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
tabScroll.Parent = sidebar

local tabLayout = Instance.new("UIListLayout")
tabLayout.Padding = UDim.new(0, 5)
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Parent = tabScroll

local content = Instance.new("Frame")
content.Name = "Content"
content.Position = UDim2.fromOffset(186, 58)
content.Size = UDim2.new(1, -196, 1, -68)
content.BackgroundColor3 = COLORS.Panel
content.BorderSizePixel = 0
content.Parent = main
Instance.new("UICorner", content).CornerRadius = UDim.new(0, 9)

local pageTitle = Instance.new("TextLabel")
pageTitle.BackgroundTransparency = 1
pageTitle.Position = UDim2.fromOffset(16, 10)
pageTitle.Size = UDim2.new(1, -32, 0, 28)
pageTitle.Font = Enum.Font.GothamBold
pageTitle.Text = "Main"
pageTitle.TextColor3 = COLORS.Text
pageTitle.TextSize = 17
pageTitle.TextXAlignment = Enum.TextXAlignment.Left
pageTitle.Parent = content

local pageHint = Instance.new("TextLabel")
pageHint.BackgroundTransparency = 1
pageHint.Position = UDim2.fromOffset(16, 38)
pageHint.Size = UDim2.new(1, -32, 0, 18)
pageHint.Font = Enum.Font.Gotham
pageHint.Text = "Choose a control below."
pageHint.TextColor3 = COLORS.Muted
pageHint.TextSize = 11
pageHint.TextXAlignment = Enum.TextXAlignment.Left
pageHint.Parent = content

local itemScroll = Instance.new("ScrollingFrame")
itemScroll.Name = "Items"
itemScroll.Position = UDim2.fromOffset(10, 64)
itemScroll.Size = UDim2.new(1, -20, 1, -74)
itemScroll.BackgroundTransparency = 1
itemScroll.BorderSizePixel = 0
itemScroll.ScrollBarThickness = 4
itemScroll.ScrollBarImageColor3 = COLORS.Blue
itemScroll.CanvasSize = UDim2.new()
itemScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
itemScroll.Parent = content

local itemLayout = Instance.new("UIListLayout")
itemLayout.Padding = UDim.new(0, 8)
itemLayout.SortOrder = Enum.SortOrder.LayoutOrder
itemLayout.Parent = itemScroll

local itemPadding = Instance.new("UIPadding")
itemPadding.PaddingBottom = UDim.new(0, 8)
itemPadding.Parent = itemScroll

local function notify(message)
	pageHint.Text = message
	task.delay(2.5, function()
		if pageHint and pageHint.Parent then
			pageHint.Text = "Choose a control below."
		end
	end)
end

local function clearItems()
	for _, child in ipairs(itemScroll:GetChildren()) do
		if child:IsA("Frame") or child:IsA("TextLabel") then
			child:Destroy()
		end
	end
end

local function makeRow(info)
	if info.type == "label" then
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, -4, 0, 58)
		label.BackgroundColor3 = COLORS.Panel2
		label.BorderSizePixel = 0
		label.Font = Enum.Font.GothamBold
		label.Text = info.name .. "\n" .. (info.desc or "")
		label.TextColor3 = COLORS.Text
		label.TextSize = 13
		label.TextWrapped = true
		label.Parent = itemScroll
		Instance.new("UICorner", label).CornerRadius = UDim.new(0, 8)
		return
	end

	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, -4, 0, 62)
	row.BackgroundColor3 = COLORS.Panel2
	row.BorderSizePixel = 0
	row.Parent = itemScroll
	Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

	local name = Instance.new("TextLabel")
	name.BackgroundTransparency = 1
	name.Position = UDim2.fromOffset(12, 7)
	name.Size = UDim2.new(1, -125, 0, 22)
	name.Font = Enum.Font.GothamSemibold
	name.Text = info.name
	name.TextColor3 = COLORS.Text
	name.TextSize = 12
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.Parent = row

	local desc = Instance.new("TextLabel")
	desc.BackgroundTransparency = 1
	desc.Position = UDim2.fromOffset(12, 30)
	desc.Size = UDim2.new(1, -125, 0, 20)
	desc.Font = Enum.Font.Gotham
	desc.Text = info.desc or ""
	desc.TextColor3 = COLORS.Muted
	desc.TextSize = 10
	desc.TextXAlignment = Enum.TextXAlignment.Left
	desc.TextTruncate = Enum.TextTruncate.AtEnd
	desc.Parent = row

	if info.type == "toggle" then
		local enabled = false
		local toggle = Instance.new("TextButton")
		toggle.Size = UDim2.fromOffset(76, 29)
		toggle.Position = UDim2.new(1, -88, 0.5, -14)
		toggle.BackgroundColor3 = COLORS.Off
		toggle.Text = "OFF"
		toggle.TextColor3 = COLORS.Text
		toggle.TextSize = 11
		toggle.Font = Enum.Font.GothamBold
		toggle.Parent = row
		Instance.new("UICorner", toggle).CornerRadius = UDim.new(1, 0)

		toggle.MouseButton1Click:Connect(function()
			enabled = not enabled
			toggle.Text = enabled and "ON" or "OFF"
			local target = enabled and COLORS.Green or COLORS.Off
			TweenService:Create(toggle, TweenInfo.new(0.15), {BackgroundColor3 = target}):Play()
			notify(info.name .. (enabled and " enabled (demo)" or " disabled"))
			-- Add your own game's safe feature logic here.
		end)
	else
		local button = Instance.new("TextButton")
		button.Size = UDim2.fromOffset(100, 30)
		button.Position = UDim2.new(1, -112, 0.5, -15)
		button.BackgroundColor3 = COLORS.BlueDark
		button.Text = "RUN"
		button.TextColor3 = COLORS.Text
		button.TextSize = 11
		button.Font = Enum.Font.GothamBold
		button.Parent = row
		Instance.new("UICorner", button).CornerRadius = UDim.new(0, 7)

		button.MouseButton1Click:Connect(function()
			if info.name == "Close XT BERRY" then
				gui:Destroy()
			else
				notify(info.name .. " clicked (demo)")
			end
		end)
	end
end

local selectedTab = nil
local function showTab(tabName)
	selectedTab = tabName
	pageTitle.Text = tabName
	clearItems()
	local list = controls[tabName] or {}
	for _, info in ipairs(list) do
		makeRow(info)
	end
	if #list == 0 then
		local empty = Instance.new("TextLabel")
		empty.Size = UDim2.new(1, -4, 0, 54)
		empty.BackgroundColor3 = COLORS.Panel2
		empty.BorderSizePixel = 0
		empty.Font = Enum.Font.Gotham
		empty.Text = "No demo controls on this page yet."
		empty.TextColor3 = COLORS.Muted
		empty.TextSize = 12
		empty.Parent = itemScroll
		Instance.new("UICorner", empty).CornerRadius = UDim.new(0, 8)
	end
	for _, child in ipairs(tabScroll:GetChildren()) do
		if child:IsA("TextButton") then
			child.BackgroundColor3 = (child.Name == tabName) and COLORS.BlueDark or COLORS.Panel2
		end
	end
end

for index, tabName in ipairs(tabs) do
	local button = Instance.new("TextButton")
	button.Name = tabName
	button.LayoutOrder = index
	button.Size = UDim2.new(1, 0, 0, 32)
	button.BackgroundColor3 = COLORS.Panel2
	button.BorderSizePixel = 0
	button.Text = "  " .. tabName
	button.TextColor3 = COLORS.Text
	button.TextSize = 11
	button.Font = Enum.Font.GothamSemibold
	button.TextXAlignment = Enum.TextXAlignment.Left
	button.AutoButtonColor = true
	button.Parent = tabScroll
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)
	button.MouseButton1Click:Connect(function()
		showTab(tabName)
	end)
end

-- Drag window using the top bar
local dragging = false
local dragStart
local startPosition

top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPosition = main.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(
			startPosition.X.Scale, startPosition.X.Offset + delta.X,
			startPosition.Y.Scale, startPosition.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

showTab("Main")
