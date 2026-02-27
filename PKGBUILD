# Maintainer: Shorin <2433516202@qq.com>

pkgname=shorin-contrib-git
_pkgname=shorin-contrib
pkgver=r3.6dca334
pkgrel=4
pkgdesc="Shorin's personal Arch Linux toolbox and system utilities (Subcommand version)"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorin-contrib"
license=('GPL3')
depends=('bash')
makedepends=('git')
install='shorin-contrib.install'

# 可选依赖：让用你包的人知道特定子命令需要什么环境
optdepends=(
    'snapper: for quicksave/quickload btrfs snapshot support'
    'btrfs-assistant: for advanced btrfs restoration backend'
    'fuzzel: for GUI menus in Wayland'
    'libnotify: for desktop notifications'
    'ffmpeg: for video2gif utility'
    'fzf: for pacman TUI'
    'timg: for lsi image preview'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("git+https://github.com/SHORiN-KiWATA/shorin-contrib.git")
sha256sums=('SKIP')

# 自动获取最新的 Git commit 数量作为版本号
pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"

    # 1. 创建私有库目录，用于存放真实的脚本实体
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"

    # 2. 将仓库中所有子目录下的文件“拍平”复制到私有库目录中
    # 忽略 .git 目录和隐藏文件，仅拷贝普通文件，并赋予执行权限
    find . -mindepth 2 -type f -not -path "*/\.git/*" -exec install -Dm755 {} "${pkgdir}/usr/lib/${_pkgname}/" \;

    # 3. 生成全局统一调度命令：/usr/bin/shorin
    install -dm755 "${pkgdir}/usr/bin"
    
cat << 'EOF' > "${pkgdir}/usr/bin/shorin"
#!/bin/bash
# Shorin Contrib - Subcommand Dispatcher

LIB_DIR="/usr/lib/shorin-contrib"

# 如果没有输入参数，动态打印所有可用的子命令
if [ $# -eq 0 ]; then
    echo "用法: shorin <子命令|link|unlink> [选项]"
    echo -e "\n可用子命令:"
    find "$LIB_DIR" -maxdepth 1 -type f -printf "  %f\n" | sort
    echo -e "\n环境管理:"
    echo "  link      在 ~/.local/bin 创建所有工具的独立软链接 (免前缀运行)"
    echo "  unlink    移除所有通过 link 创建的软链接"
    exit 1
fi

COMMAND="$1"
shift

# 处理自带的软链接管理命令
if [ "$COMMAND" = "link" ]; then
    mkdir -p "$HOME/.local/bin"
    for script in "$LIB_DIR"/*; do
        if [ -f "$script" ]; then
            base_name=$(basename "$script")
            ln -sf "$script" "$HOME/.local/bin/$base_name"
            echo "已创建链接: ~/.local/bin/$base_name -> $script"
        fi
    done
    echo -e "\n链接部署完成！请确保 ~/.local/bin 已加入你的 PATH 环境变量。"
    exit 0
elif [ "$COMMAND" = "unlink" ]; then
    for script in "$LIB_DIR"/*; do
        if [ -f "$script" ]; then
            base_name=$(basename "$script")
            rm -f "$HOME/.local/bin/$base_name"
            echo "已移除链接: ~/.local/bin/$base_name"
        fi
    done
    echo -e "\n链接清理完成！"
    exit 0
fi

# 路由分发逻辑
TARGET_SCRIPT="$LIB_DIR/$COMMAND"

if [ -x "$TARGET_SCRIPT" ]; then
    exec "$TARGET_SCRIPT" "$@"
else
    echo "shorin: 未知子命令 '$COMMAND'" >&2
    echo "运行 'shorin' 查看所有可用命令。" >&2
    exit 1
fi
EOF

    # 赋予主命令执行权限
    chmod +x "${pkgdir}/usr/bin/shorin"

    # 4. 生成 Fish 自动补全脚本
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
    cat << 'EOF' > "${pkgdir}/usr/share/fish/vendor_completions.d/shorin.fish"
# 禁用默认的文件补全
complete -c shorin -f
# 动态补全子命令
complete -c shorin -a "(ls /usr/lib/shorin-contrib/ 2>/dev/null)"
EOF
}
