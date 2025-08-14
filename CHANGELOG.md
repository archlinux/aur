# 更新日志

## v1.0.0 (2025-08-14)

### 🎉 初始版本

- 为 Fish shell 提供完整的 nvm 集成支持
- 支持所有 nvm 命令和功能
- 自动版本切换（.nvmrc 文件支持）

### 🔧 智能 Bass 管理

- **自动检测现有安装**：检查用户是否已安装 bass
- **插件管理器支持**：自动使用 fisher、Oh My Fish、fundle 安装 bass
- **本地回退方案**：无插件管理器时从 GitHub 下载源码本地配置
- **环境保护**：不破坏用户现有的 Fish 配置

### ✨ 零配置体验

- **首次使用自动配置**：运行 `nvm --version` 即自动完成所有设置
- **无需手动脚本**：移除了手动配置脚本，实现真正的即开即用
- **智能检测**：自动检测并配置 Fish shell 集成
- **一键启用**：自动启用 .nvmrc 文件支持

### 📦 包特性

- 依赖官方 nvm 包（Arch Linux extra 仓库）
- 智能 bass 依赖管理，无需用户手动安装
- 零配置安装体验
- 详细的中文文档

### 🗂️ 文件组成

- `nvm.fish` - 主要 nvm 命令包装器（含自动配置）
- `nvm_find_nvmrc.fish` - .nvmrc 文件查找
- `load_nvm.fish` - 自动版本切换
- `bass_helper.fish` - 智能 bass 环境管理和自动配置

### 🚀 用户体验

1. 安装包：`yay -S nvm-fish`
2. 使用nvm：`nvm --version`（自动完成所有配置）
3. 享受功能：支持所有 nvm 命令和 .nvmrc 自动切换