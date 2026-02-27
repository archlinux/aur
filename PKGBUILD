# Maintainer: Shorin <2433516202@qq.com>

pkgname=shorin-contrib-git
_pkgname=shorin-contrib
pkgver=r4.9419d69
pkgrel=5
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

    # 2. 拍平复制所有脚本
    find . -mindepth 2 -type f -not -path "*/\.git/*" -exec install -Dm755 {} "${pkgdir}/usr/lib/${_pkgname}/" \;

    # 3. 配置全局命令
    install -dm755 "${pkgdir}/usr/bin"
    
    ln -sf "/usr/lib/${_pkgname}/quicksave" "${pkgdir}/usr/bin/quicksave"
    ln -sf "/usr/lib/${_pkgname}/quickload" "${pkgdir}/usr/bin/quickload"
    
    # 写入 shorin 主调度器
    cat << 'EOF' > "${pkgdir}/usr/bin/shorin"
#!/bin/bash
# Shorin Contrib - Subcommand Dispatcher

LIB_DIR="/usr/lib/shorin-contrib"

if [ $# -eq 0 ]; then
    echo "用法: shorin <子命令|link|unlink> [选项]"
    echo -e "\n可用子命令:"
    find "$LIB_DIR" -maxdepth 1 -type f -printf "  %f\n" | sort
    echo -e "\n环境管理:"
    echo "  link      生成本地用户的快捷软链接 (全程免密)"
    echo "  unlink    移除本地软链接"
    exit 1
fi

COMMAND="$1"
shift

# 软链接管理模块 (纯用户态，绝不弹 sudo)
if [ "$COMMAND" = "link" ]; then
    mkdir -p "$HOME/.local/bin"
    echo "开始生成本地快捷命令..."
    
    for script in "$LIB_DIR"/*; do
        if [ -f "$script" ]; then
            base_name=$(basename "$script")
            
            # 排除掉已经全局安装好的灾备命令
            if [[ "$base_name" != "quicksave" && "$base_name" != "quickload" ]]; then
                ln -sf "$script" "$HOME/.local/bin/$base_name"
                echo "  [User] 已链接: ~/.local/bin/$base_name"
            fi
        fi
    done
    echo -e "\n链接部署完成！"
    exit 0

elif [ "$COMMAND" = "unlink" ]; then
    echo "开始清理快捷命令..."
    for script in "$LIB_DIR"/*; do
        if [ -f "$script" ]; then
            base_name=$(basename "$script")
            if [[ "$base_name" != "quicksave" && "$base_name" != "quickload" ]]; then
                rm -f "$HOME/.local/bin/$base_name"
                echo "  [User] 已移除: ~/.local/bin/$base_name"
            fi
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

    chmod +x "${pkgdir}/usr/bin/shorin"

    # 4. 生成 Fish 自动补全脚本
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
    cat << 'EOF' > "${pkgdir}/usr/share/fish/vendor_completions.d/shorin.fish"
complete -c shorin -f
complete -c shorin -a "(ls /usr/lib/shorin-contrib/ 2>/dev/null)"
EOF
}
