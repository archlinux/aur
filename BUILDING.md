# 构建和发布指南

## 文件结构

```
nvm-fish/
├── PKGBUILD              # AUR 包构建脚本
├── .SRCINFO              # AUR 包信息文件
├── nvm-fish.install      # 安装后脚本
├── nvm.fish              # nvm 主函数（含自动配置）
├── nvm_find_nvmrc.fish   # 查找 .nvmrc 文件函数
├── load_nvm.fish         # 自动加载函数
├── bass_helper.fish      # 智能 bass 环境管理
├── README.md             # 使用说明
└── BUILDING.md           # 本文件
```

## 构建包

```bash
# 检查 PKGBUILD 语法
makepkg --check

# 构建包
makepkg

# 生成 .SRCINFO (发布到 AUR 前必须)
makepkg --printsrcinfo > .SRCINFO
```

## 发布到 AUR

1. 创建 AUR 账户并设置 SSH 密钥
2. 克隆 AUR 仓库：
   ```bash
   git clone ssh://aur@aur.archlinux.org/nvm-fish.git aur-nvm-fish
   ```
3. 复制文件到 AUR 仓库：
   ```bash
   cp PKGBUILD .SRCINFO nvm-fish.install *.fish aur-nvm-fish/
   ```
4. 提交并推送：
   ```bash
   cd aur-nvm-fish
   git add .
   git commit -m "Initial commit: nvm-fish v1.0.0"
   git push
   ```

## 测试安装

```bash
# 本地安装测试
sudo pacman -U nvm-fish-1.0.0-1-any.pkg.tar.zst

# 测试功能（自动配置）
fish
nvm --version  # 首次使用会自动配置所有环境

# 测试自动版本切换
echo "18.17.0" > .nvmrc
cd .  # 触发目录切换事件
```

## 版本更新

1. 更新 `PKGBUILD` 中的 `pkgver`
2. 更新 `pkgrel` (如果同一版本有修复)
3. 重新生成 `.SRCINFO`
4. 提交到 AUR