# Maintainer: Rodrigo Santiago <rodrigosantsilva@gmail.com>
pkgname=omarchy-ai-usage-git
_pkgname=omarchy-ai-usage
pkgver=fdb29ca
pkgrel=1
pkgdesc="AI usage monitoring for Omarchy (Claude, Codex, Gemini, Antigravity) in Waybar"
arch=('any')
url="https://github.com/rodrigo-sntg/omarchy-ai-usage"
license=('MIT')
depends=('jq' 'curl' 'gum' 'waybar' 'python')
makedepends=('git')
optdepends=(
    'claude-code: Claude CLI for usage monitoring'
    'gemini-cli: Gemini CLI for usage monitoring'
    'codex: OpenAI Codex CLI for usage monitoring'
    'libnotify: Desktop notifications for high usage alerts'
    'wl-clipboard: Clipboard export (Wayland)'
    'xclip: Clipboard export (X11)'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${_pkgname}"

    # Install all scripts to shared location
    install -d "$pkgdir/usr/share/${_pkgname}/scripts"
    install -m755 scripts/*.sh "$pkgdir/usr/share/${_pkgname}/scripts/"

    # Install setup/remove helpers to /usr/bin
    install -Dm755 install.sh   "$pkgdir/usr/bin/${_pkgname}-setup"
    install -Dm755 uninstall.sh "$pkgdir/usr/bin/${_pkgname}-remove"

    # License and docs
    install -Dm644 LICENSE  "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
}
