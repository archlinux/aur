# Maintainer: Shorin <2433516202@qq.com>

pkgname=shorin-contrib-git
_pkgname=shorin-contrib
pkgver=r35.338da1c
pkgrel=2
pkgdesc="Shorin's personal Arch Linux toolbox and system utilities (Subcommand version)"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorin-contrib"
license=('GPL3')
depends=('bash' 'fzf')
makedepends=('git')
install='shorin-contrib.install'

# 可选依赖：让用你包的人知道特定子命令需要什么环境
optdepends=(
    'snapper: for quicksave/quickload btrfs snapshot support'
    'btrfs-assistant: for advanced btrfs restoration backend'
    'fuzzel: for GUI menus in Wayland'
    'libnotify: for desktop notifications'
    'ffmpeg: for video2gif utility'
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

    # 1. 创建私有库目录
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"

    # 2. 拍平复制所有脚本
    find . -mindepth 2 -type f -not -path "*/\.git/*" -exec install -Dm755 {} "${pkgdir}/usr/lib/${_pkgname}/" \;

    # 3. 配置全局命令
    install -dm755 "${pkgdir}/usr/bin"
    
    # 系统级（需 root 或全局可用）的命令，直接在打包阶段链接到 /usr/bin
    ln -sf "/usr/lib/${_pkgname}/quicksave" "${pkgdir}/usr/bin/quicksave"
    ln -sf "/usr/lib/${_pkgname}/quickload" "${pkgdir}/usr/bin/quickload"
    ln -sf "/usr/lib/${_pkgname}/change-grub-theme" "${pkgdir}/usr/bin/change-grub-theme"
    
    # 写入增强版 shorin 主调度器
    cat << 'EOF' > "${pkgdir}/usr/bin/shorin"
#!/bin/bash
set -euo pipefail

# =============================================================================
# 功能描述:
#   Shorin Contrib 的主调度器。
#   支持动态解析子命令描述，执行对应脚本，以及为普通用户生成免密本地快捷链接。
# =============================================================================

LIB_DIR="/usr/lib/shorin-contrib"

# 颜色定义
BLUE='\033[0;34m'
NC='\033[0m'

if [ $# -eq 0 ]; then
    echo -e "用法: ${BLUE}shorin${NC} <子命令> [选项]"
    echo -e "\n可用子命令:"
    
    # 遍历库目录并提取描述
    for script in "$LIB_DIR"/*; do
        if [ -x "$script" ]; then
            name=$(basename "$script")
            # 提取第二行，去掉开头的 "# " 或 "# Description: "
            desc=$(sed -n '2p' "$script" | sed -E 's/^# (Description: )?//')
            printf "  ${BLUE}%-15s${NC} %s\n" "$name" "$desc"
        fi
    done | sort
    
    echo -e "\n环境管理:"
    printf "  ${BLUE}%-15s${NC} %s\n" "link" "生成本地用户的快捷软链接 (全程免密)"
    printf "  ${BLUE}%-15s${NC} %s\n" "unlink" "移除本地软链接"
    exit 1
fi

COMMAND="$1"
shift

# 软链接管理模块
if [ "$COMMAND" = "link" ]; then
    mkdir -p "$HOME/.local/bin"
    echo "开始生成本地快捷命令..."
    for script in "$LIB_DIR"/*; do
        if [ -f "$script" ]; then
            base_name=$(basename "$script")
            # 排除已经是全局命令的脚本
            if [[ "$base_name" != "quicksave" && "$base_name" != "quickload" && "$base_name" != "change-grub-theme" ]]; then
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
            # 排除已经是全局命令的脚本
            if [[ "$base_name" != "quicksave" && "$base_name" != "quickload" && "$base_name" != "change-grub-theme" ]]; then
                rm -f "$HOME/.local/bin/$base_name"
                echo "  [User] 已移除: ~/.local/bin/$base_name"
            fi
        fi
    done
    echo -e "\n链接清理完成！"
    exit 0
fi

TARGET_SCRIPT="$LIB_DIR/$COMMAND"
if [ -x "$TARGET_SCRIPT" ]; then
    exec "$TARGET_SCRIPT" "$@"
else
    echo "shorin: 未知子命令 '$COMMAND'" >&2
    exit 1
fi
EOF

    chmod +x "${pkgdir}/usr/bin/shorin"

    # 4. Fish 补全 (保持不变)
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
    cat << 'EOF' > "${pkgdir}/usr/share/fish/vendor_completions.d/shorin.fish"
complete -c shorin -f
complete -c shorin -a "(ls /usr/lib/shorin-contrib/ 2>/dev/null)"
EOF
}
