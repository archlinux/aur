# Maintainer: Shorin <2433516202@qq.com>

pkgname=shorin-contrib-git
_pkgname=shorin-contrib
pkgver=r93.c9f9890
pkgrel=1
pkgdesc="Shorin's personal Arch Linux toolbox and system utilities (Subcommand version)"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorin-contrib"
license=('GPL3')
# pac / pacr 已拆到 shorin-pac；作为硬依赖带上，老用户升级后 shorin pac 照常可用。
depends=('bash' 'curl' 'fzf' 'jq' 'pacman-contrib' 'shorin-pac')
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
    find . -mindepth 2 -type f \
        -not -path "*/\.git/*" \
        -not -path "./share/*" \
        -exec install -Dm755 {} "${pkgdir}/usr/lib/${_pkgname}/" \;

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
# 功能描述: Shorin Contrib 的主调度器。
#   支持动态解析子命令描述，并根据 LANG 环境变量显示中文/英文。
# =============================================================================

LIB_DIR="/usr/lib/shorin-contrib"

# --------------------- 语言检测 ---------------------
if [[ "${LANG:-}" == zh_CN* ]]; then
    IS_CN=true
else
    IS_CN=false
fi

# --------------------- 双语字符串定义 ---------------------
if $IS_CN; then
    USAGE_STR="用法:"
    AVAIL_STR="可用子命令:"
    PAC_STR="来自 shorin-pac (已是全局命令，也可用 shorin <子命令> 调用):"
    ENV_STR="环境管理:"
    LINK_DESC="生成本地用户的快捷软链接 (全程免密)"
    UNLINK_DESC="移除本地软链接"
    LINK_START="开始生成本地快捷命令..."
    LINK_DONE="链接部署完成！"
    LINK_ITEM="[User] 已链接:"
    LINK_STALE="[User] 已清理失效链接:"
    UNLINK_START="开始清理快捷命令..."
    UNLINK_DONE="链接清理完成！"
    UNLINK_ITEM="[User] 已移除:"
    UNKNOWN_CMD="未知子命令"
    PACRRR_MOVED="pacrrr 已并入 pacr（卸载时可选 AI 清理残留），正在转到 pacr --clean ..."
    SUB_PLACEHOLDER="<子命令>"
    OPT_PLACEHOLDER="[选项]"
else
    USAGE_STR="Usage:"
    AVAIL_STR="Available subcommands:"
    PAC_STR="From shorin-pac (global commands; also available as shorin <subcommand>):"
    ENV_STR="Environment management:"
    LINK_DESC="Create no-password local symlinks for user"
    UNLINK_DESC="Remove local symlinks"
    LINK_START="Creating local symlinks..."
    LINK_DONE="Symlink deployment complete!"
    LINK_ITEM="[User] Linked:"
    LINK_STALE="[User] Removed stale link:"
    UNLINK_START="Cleaning up symlinks..."
    UNLINK_DONE="Symlink cleanup complete!"
    UNLINK_ITEM="[User] Removed:"
    UNKNOWN_CMD="unknown subcommand"
    PACRRR_MOVED="pacrrr has been merged into pacr (optional AI leftover cleanup on removal); forwarding to pacr --clean ..."
    SUB_PLACEHOLDER="<subcommand>"
    OPT_PLACEHOLDER="[options]"
fi

# 颜色定义
BLUE='\033[0;34m'
NC='\033[0m'

# shorin-pac 委托：pac / pacr 现在由 shorin-pac 包装成全局命令（/usr/bin/pac、/usr/bin/pacr）。
SHORIN_PAC_CMDS="pac pacr"
is_shorin_pac_subcmd() {
    local name
    for name in $SHORIN_PAC_CMDS; do
        [ "$name" = "$1" ] && command -v "$name" >/dev/null 2>&1 && return 0
    done
    return 1
}

# ===================== 无参数时显示帮助 =====================
if [ $# -eq 0 ]; then
    echo -e "${USAGE_STR} ${BLUE}shorin${NC} ${SUB_PLACEHOLDER} ${OPT_PLACEHOLDER}"
    echo -e "\n${AVAIL_STR}"

    # 遍历库目录，提取对应语言的描述
    for script in "$LIB_DIR"/*; do
        if [ -x "$script" ]; then
            name=$(basename "$script")
            if $IS_CN; then
                # 中文：提取第二行，去掉 "# 描述：" 前缀
                desc=$(sed -n '2p' "$script" | sed -E 's/^#[[:space:]]*描述：[[:space:]]*//')
            else
                # 英文：提取第三行，去掉 "# Description:" 前缀
                desc=$(sed -n '3p' "$script" | sed -E 's/^#[[:space:]]*Description:[[:space:]]*//')
            fi
            # 若描述为空，显示占位符
            [ -z "$desc" ] && desc="-"
            printf "  ${BLUE}%-15s${NC} %s\n" "$name" "$desc"
        fi
    done | sort

    if is_shorin_pac_subcmd pac || is_shorin_pac_subcmd pacr; then
        echo -e "\n${PAC_STR}"
        for name in $SHORIN_PAC_CMDS; do
            is_shorin_pac_subcmd "$name" || continue
            script="$(command -v "$name")"
            if $IS_CN; then
                desc=$(sed -n '2p' "$script" 2>/dev/null | sed -E 's/^#[[:space:]]*描述：[[:space:]]*//' || true)
            else
                desc=$(sed -n '3p' "$script" 2>/dev/null | sed -E 's/^#[[:space:]]*Description:[[:space:]]*//' || true)
            fi
            printf "  ${BLUE}%-15s${NC} %s\n" "$name" "${desc:--}"
        done
    fi

    echo -e "\n${ENV_STR}"
    printf "  ${BLUE}%-15s${NC} %s\n" "link"   "$LINK_DESC"
    printf "  ${BLUE}%-15s${NC} %s\n" "unlink" "$UNLINK_DESC"
    exit 1
fi

COMMAND="$1"
shift

# ===================== 软链接管理 =====================
if [ "$COMMAND" = "link" ]; then
    mkdir -p "$HOME/.local/bin"
    echo "$LINK_START"
    # 先清掉指向本库目录但目标已不存在的悬空链接（如老版本留下的 pac/pacr/pacrrr），
    # 它们会遮住 shorin-pac 新建的同名命令。
    for link in "$HOME/.local/bin"/*; do
        if [ -L "$link" ] && [ ! -e "$link" ]; then
            case "$(readlink "$link")" in
                "$LIB_DIR"/*|/usr/lib/shorin-pac/*)
                    rm -f "$link"
                    echo "  ${LINK_STALE} ~/.local/bin/$(basename "$link")"
                    ;;
            esac
        fi
    done
    for script in "$LIB_DIR"/*; do
        if [ -f "$script" ]; then
            base_name=$(basename "$script")
            if [[ "$base_name" != "quicksave" && "$base_name" != "quickload" && "$base_name" != "change-grub-theme" ]]; then
                ln -sf "$script" "$HOME/.local/bin/$base_name"
                echo "  ${LINK_ITEM} ~/.local/bin/$base_name"
            fi
        fi
    done
    echo -e "\n${LINK_DONE}"
    exit 0
elif [ "$COMMAND" = "unlink" ]; then
    echo "$UNLINK_START"
    for script in "$LIB_DIR"/*; do
        if [ -f "$script" ]; then
            base_name=$(basename "$script")
            if [[ "$base_name" != "quicksave" && "$base_name" != "quickload" && "$base_name" != "change-grub-theme" ]]; then
                rm -f "$HOME/.local/bin/$base_name"
                echo "  ${UNLINK_ITEM} ~/.local/bin/$base_name"
            fi
        fi
    done
    echo -e "\n${UNLINK_DONE}"
    exit 0
fi

# ===================== 执行子命令 =====================
TARGET_SCRIPT="$LIB_DIR/$COMMAND"
if [ -x "$TARGET_SCRIPT" ]; then
    exec "$TARGET_SCRIPT" "$@"
elif is_shorin_pac_subcmd "$COMMAND"; then
    exec "$COMMAND" "$@"
elif [ "$COMMAND" = "pacrrr" ] && is_shorin_pac_subcmd pacr; then
    echo "shorin: ${PACRRR_MOVED}" >&2
    exec pacr --clean "$@"
else
    echo "shorin: ${UNKNOWN_CMD} '$COMMAND'" >&2
    exit 1
fi
EOF

    chmod +x "${pkgdir}/usr/bin/shorin"

    # 4. Fish 补全 (保持不变)
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
    cat << 'EOF' > "${pkgdir}/usr/share/fish/vendor_completions.d/shorin.fish"
complete -c shorin -f
complete -c shorin -a "(ls /usr/lib/shorin-contrib/ 2>/dev/null; command -q pac; and echo pac; command -q pacr; and echo pacr)"
EOF
}
