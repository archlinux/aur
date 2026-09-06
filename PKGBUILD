# Maintainer: Shorin <2433516202@qq.com>

pkgname=shorin-pac-git
_pkgname=shorin-pac
pkgver=r30.15f0004
pkgrel=1
pkgdesc="Simple fzf-based TUI to install/remove pacman, AUR and Flatpak packages on Arch, with AI-assisted AUR review and leftover cleanup"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorin-pac"
license=('GPL-3.0-or-later')
depends=('bash' 'curl' 'fzf' 'jq' 'pacman')
makedepends=('git')
install="${_pkgname}.install"
optdepends=(
    'paru: preferred AUR helper'
    'yay: fallback AUR helper (pac can install it for you)'
    'flatpak: list and remove Flatpak apps in pacr'
    'trash-cli: send leftovers to the trash instead of deleting'
    'claude-code: AI backend via the claude CLI subscription'
    'opencode: AI backend via the opencode CLI'
    'miyu: AI backend via Miyu, and import of Miyu provider settings'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("git+https://github.com/SHORiN-KiWATA/shorin-pac.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"

    # 命令直接进 /usr/bin：pac（安装）、pacr（卸载）；`pac config` 配置 AI
    install -Dm755 bin/pac "${pkgdir}/usr/bin/pac"
    install -Dm755 bin/pacr "${pkgdir}/usr/bin/pacr"

    # 共享库与提示词
    install -Dm644 lib/shorin-pac.sh "${pkgdir}/usr/lib/${_pkgname}/lib/shorin-pac.sh"
    local f
    for f in prompts/*.md; do
        install -Dm644 "$f" "${pkgdir}/usr/lib/${_pkgname}/prompts/$(basename "$f")"
    done

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # fish 补全
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
    cat << 'FISH' > "${pkgdir}/usr/share/fish/vendor_completions.d/pac.fish"
complete -c pac -f
complete -c pac -n '__fish_use_subcommand' -a 'config' -d 'Configure AI provider and model'
complete -c pac -l check -s c -d 'Review AUR packages only'
complete -c pac -l refresh -s y -d 'Force refresh AUR list'
complete -c pac -l ai -r -d 'AI provider[:model] for this run'
FISH
    cat << 'FISH' > "${pkgdir}/usr/share/fish/vendor_completions.d/pacr.fish"
complete -c pacr -f
complete -c pacr -n '__fish_use_subcommand' -a 'config' -d 'Configure AI provider and model'
complete -c pacr -l clean -d 'Detect leftovers with AI (no prompt)'
complete -c pacr -l no-clean -d 'Skip leftover detection'
complete -c pacr -l scan -d 'Only list leftovers'
complete -c pacr -l rm -d 'Delete leftovers instead of trashing'
complete -c pacr -l ai -r -d 'AI provider[:model] for this run'
FISH
}
