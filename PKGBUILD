# Maintainer: Your Name <khvalera[@]ukr.net>

pkgname=port-forward
pkgver=1.0.0
pkgrel=1
pkgdesc="Universal port forwarding manager using socat"
arch=('any')
url="https://github.com/snuglinux/port-forward"
license=('MIT')
depends=('socat' 'bash')
optdepends=('jq: localized messages (JSON locales)')
makedepends=()
source=("https://github.com/snuglinux/port-forward/archive/refs/tags/$pkgver.tar.gz")
install=${pkgname}.install
sha256sums=('ce0448b98ad813bd2f6cd764db70e777bbc23ce22ee5408d78dd2ac3892c0bd7')
backup=("etc/port-forward/port-forward.conf"
        "etc/port-forward/ports.conf")

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install main script
    install -Dm755 src/port-forward.sh "$pkgdir/usr/bin/port-forward.sh"
    ln -s /usr/bin/port-forward.sh     "$pkgdir/usr/bin/port-forward"

    # Install configuration files
    install -Dm644 src/port-forward.conf  "$pkgdir/usr/share/port-forward/port-forward.conf.example"
    install -Dm644 src/ports.conf.example "$pkgdir/usr/share/port-forward/ports.conf.example"
    install -Dm644 src/port-forward.conf  "$pkgdir/etc/port-forward/port-forward.conf"
    install -Dm644 src/ports.conf.example "$pkgdir/etc/port-forward/ports.conf"

    # Install localization files
    install -Dm644 src/locales/en.json "$pkgdir/usr/share/port-forward/locale/en.json"
    install -Dm644 src/locales/uk.json "$pkgdir/usr/share/port-forward/locale/uk.json"

    # Install systemd services
    install -Dm644 systemd/port-forward.service "$pkgdir/usr/lib/systemd/system/port-forward.service"

    # Install sysusers and tmpfiles rules
    install -Dm644 systemd/sysusers.d/port-forward.conf "$pkgdir/usr/lib/sysusers.d/port-forward.conf"
    install -Dm644 systemd/tmpfiles.d/port-forward.conf "$pkgdir/usr/lib/tmpfiles.d/port-forward.conf"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

