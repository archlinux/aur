-- if there is not a local plugin dir, lazy will complain
-- thus we check and make the dir for the user if it doesn't.
--
local user_config_dir = vim.fn.stdpath("config")
if not user_config_dir or user_config_dir == "" then
  vim.schedule(function()
    vim.notify("[NvChad] Error: Could not determine user config directory.", vim.log.levels.ERROR)
  end)
  return
end

local plugins_module_dir = user_config_dir .. "/lua/plugins"
local plugins_init_file = plugins_module_dir .. "/init.lua"

-- Check if the plugins init file already exists using Neovim's fs_stat
-- vim.uv.fs_stat returns nil if path does not exist, or a table with stats if it does.
if vim.uv.fs_stat(plugins_init_file) ~= nil then
  -- File already exists, user might have already configured it. Do nothing.
  return
end

-- File does not exist, so we need to create it.
-- Create the directory structure: ~/.config/nvim/lua/plugins/
local mkdir_result = vim.fn.mkdir(plugins_module_dir, "p")

if not (mkdir_result == 0 or mkdir_result == 1) then
  vim.schedule(function()
    vim.notify(
      "[NvChad] Error: Failed to create directory '" .. plugins_module_dir .. "'. mkdir result: " .. mkdir_result,
      vim.log.levels.ERROR
    )
  end)
  return
end

local file, err_msg_open = io.open(plugins_init_file, "w")

if not file then
  vim.schedule(function()
    vim.notify(
      "[NvChad] Error: Failed to open " .. plugins_init_file .. " for writing: " .. (err_msg_open or "unknown error"),
      vim.log.levels.ERROR
    )
  end)
  return
end

local content = table.concat({
  "-- This file was automatically created by the NvChad system package",
  "-- to ensure NvChad starts correctly without errors.",
  "--",
  "-- You can add your custom lazy.nvim plugin specifications here.",
  "-- For example:",
  "-- return {",
  "--   { \"nvim-lua/plenary.nvim\" },",
  "--   -- add more plugins here",
  "-- }",
  "--",
  "-- If you have no custom plugins yet, NvChad requires this file to return an empty table.",
  "return {}",
  ""
}, "\n")

local write_ok, err_msg_write = file:write(content)
file:close()

if not write_ok then
  vim.schedule(function()
    vim.notify(
      "[NvChad] Error: Failed to write to " .. plugins_init_file .. ": " .. (err_msg_write or "unknown error"),
      vim.log.levels.ERROR
    )
  end)
  return
end

vim.schedule(function()
  vim.notify("[NvChad] Created default user plugins file to prevent startup errors: " .. plugins_init_file, vim.log.levels.INFO)
end)
