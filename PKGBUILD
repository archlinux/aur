# Maintainer: rikkichy
pkgname=openwave
pkgver=0.1.2
pkgrel=1
pkgdesc="Linux control application for the Elgato Wave XLR"
arch=('any')
url="https://github.com/rikkichy/openwave"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'libusb' 'pipewire')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rikkichy/openwave/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install Python package
    local site=$(python3 -c "import site; print(site.getsitepackages()[0])")
    install -dm755 "$pkgdir$site/wavexlr"
    install -Dm644 wavexlr/*.py "$pkgdir$site/wavexlr/"

    # Launcher script
    install -dm755 "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec python3 -m wavexlr "$@"\n' > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Desktop entry
    install -Dm644 wavexlr.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Docs
    install -Dm644 docs/protocol.md "$pkgdir/usr/share/doc/$pkgname/protocol.md"
    install -Dm644 docs/findings.md "$pkgdir/usr/share/doc/$pkgname/findings.md"
}
