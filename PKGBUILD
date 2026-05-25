# Maintainer: rikkichy
pkgname=openwave
pkgver=1.0.0
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
    install -Dm644 wavexlr/style.css "$pkgdir$site/wavexlr/style.css"

    # Launcher script
    install -dm755 "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec python3 -m wavexlr "$@"\n' > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Desktop entry
    install -Dm644 wavexlr.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # WirePlumber rule (read by setup.py at first-run, copied to user config)
    install -Dm644 wireplumber/51-openwave-wave-xlr.conf \
        "$pkgdir/usr/share/openwave/wireplumber/51-openwave-wave-xlr.conf"

    # PipeWire virtual mix sinks (Personal / Chat / Record)
    install -Dm644 pipewire/52-openwave-mixes.conf \
        "$pkgdir/usr/share/openwave/pipewire/52-openwave-mixes.conf"
}
