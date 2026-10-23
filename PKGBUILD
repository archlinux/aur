# Maintainer: vredix-openvuture <vredix@openvuture.com>
pkgname=gifetch
pkgver=1.0.0
pkgrel=1
pkgdesc="Puts an animated GIF next to your fastfetch output, for the kitty terminal"
arch=('any')
url="https://github.com/vredix-openvuture/gifetch"
license=('GPL-3.0-or-later')
depends=('python' 'fastfetch')
optdepends=(
    'kitty: draws the animated image (elsewhere gifetch runs plain fastfetch)'
    'imagemagick: background removal with gifetch-make-transparent'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e31d6a9a0697ba5e86c60744231a1c4019c773e3a6b05501d9b03cfad48ed3ad')

check() {
    cd "$pkgname-$pkgver"
    python -m unittest discover -s tests
}

package() {
    cd "$pkgname-$pkgver"
    local lib="$pkgdir/usr/lib/$pkgname"
    install -Dm755 gifetch.py "$lib/gifetch.py"
    install -Dm644 -t "$lib/gifetch" gifetch/*.py
    install -Dm644 -t "$lib/defaults" defaults/default.gif defaults/default.jsonc
    python -m compileall -q -d "/usr/lib/$pkgname/gifetch" "$lib/gifetch"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/gifetch.py" "$pkgdir/usr/bin/gifetch"
    install -Dm755 tools/make-transparent.sh "$pkgdir/usr/bin/gifetch-make-transparent"

    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/examples" examples/*.jsonc
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
