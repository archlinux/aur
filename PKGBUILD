# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=code-notify
pkgver=1.5.0
pkgrel=1
pkgdesc="Desktop notifications for AI coding tools (Claude Code, Codex, Gemini CLI)"
arch=('any')
url="https://github.com/mylee04/code-notify"
license=('MIT')
depends=('bash' 'libnotify')
optdepends=(
    'jq: for JSON parsing in config files'
    'espeak-ng: for voice announcements'
)
provides=('claude-notify')
conflicts=('claude-notify')
replaces=('claude-notify')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mylee04/code-notify/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('50de8759d3cd44bce3b480083a399119a5433afad3c6df805bc8429360cd5179')

package() {
    cd "${pkgname}-${pkgver}"

    # Install library files
    install -dm755 "$pkgdir/usr/share/$pkgname/lib"
    cp -r lib/code-notify/* "$pkgdir/usr/share/$pkgname/lib/"

    # Install main binary with patched path
    install -Dm755 bin/code-notify "$pkgdir/usr/bin/code-notify"
    sed -i 's|LIB_DIR="$(dirname "$SCRIPT_DIR")/lib/code-notify"|LIB_DIR="/usr/share/code-notify/lib"|' \
        "$pkgdir/usr/bin/code-notify"

    # Create aliases (cn and cnp are documented shortcuts)
    ln -s code-notify "$pkgdir/usr/bin/cn"
    ln -s code-notify "$pkgdir/usr/bin/cnp"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
