# Maintainer: rodrigosntg <rodrigo-sntg at github>
pkgname=omarchy-ai-usage-git
_pkgname=omarchy-ai-usage
pkgver=r2.8fe03d6
pkgrel=2
pkgdesc="AI usage monitoring for Omarchy — track Claude and Codex rate limits in Waybar"
arch=('any')
url="https://github.com/rodrigo-sntg/omarchy-ai-usage"
license=('MIT')
depends=('jq' 'curl' 'gum' 'waybar' 'python')
makedepends=('git')
optdepends=(
    'claude-code: Claude CLI for usage monitoring'
    'codex: OpenAI Codex CLI for usage monitoring'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${pkgname}::git+https://github.com/rodrigo-sntg/omarchy-ai-usage.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/${pkgname}"

    # Install scripts to shared location
    install -Dm755 scripts/ai-usage.sh       "$pkgdir/usr/share/${_pkgname}/scripts/ai-usage.sh"
    install -Dm755 scripts/ai-usage-claude.sh "$pkgdir/usr/share/${_pkgname}/scripts/ai-usage-claude.sh"
    install -Dm755 scripts/ai-usage-codex.sh  "$pkgdir/usr/share/${_pkgname}/scripts/ai-usage-codex.sh"
    install -Dm755 scripts/ai-usage-tui.sh    "$pkgdir/usr/share/${_pkgname}/scripts/ai-usage-tui.sh"

    # Install setup/remove helpers to /usr/bin
    install -Dm755 install.sh   "$pkgdir/usr/bin/omarchy-ai-usage-setup"
    install -Dm755 uninstall.sh "$pkgdir/usr/bin/omarchy-ai-usage-remove"

    # License and docs
    install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
}
