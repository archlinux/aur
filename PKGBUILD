# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=code-notify
pkgver=1.6.2
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
sha256sums=('24fd3cfe3b5de22989c8c30324df4c8652c22d99fea8efab06d9546d7930ba16')

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
