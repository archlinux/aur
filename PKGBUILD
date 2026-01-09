# Maintainer: Jasmin <jasmin@example.com>
pkgname=claude-notify
pkgver=1.1.0
pkgrel=1
pkgdesc="Cross-platform desktop notifications for Claude Code"
arch=('any')
url="https://github.com/mylee04/claude-notify"
license=('MIT')
depends=('bash' 'libnotify')
optdepends=('jq: for JSON parsing in status detection')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mylee04/claude-notify/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4dd733b2321774631a06e32d54de2b2ee03c9194412d2f5076863b488f5fe9be')

package() {
    cd "${pkgname}-${pkgver}"

    # Install library files
    install -dm755 "$pkgdir/usr/share/$pkgname/lib"
    cp -r lib/claude-notify/* "$pkgdir/usr/share/$pkgname/lib/"

    # Install main binary with patched path
    install -Dm755 bin/claude-notify "$pkgdir/usr/bin/claude-notify"
    sed -i 's|LIB_DIR="$(dirname "$SCRIPT_DIR")/lib/claude-notify"|LIB_DIR="/usr/share/claude-notify/lib"|' \
        "$pkgdir/usr/bin/claude-notify"

    # Create symlinks
    ln -s claude-notify "$pkgdir/usr/bin/cn"
    ln -s claude-notify "$pkgdir/usr/bin/cnp"

    # Install completions if present
    if [[ -d completions ]]; then
        install -Dm644 completions/bash/* -t "$pkgdir/usr/share/bash-completion/completions/" 2>/dev/null || true
        install -Dm644 completions/zsh/* -t "$pkgdir/usr/share/zsh/site-functions/" 2>/dev/null || true
    fi

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
