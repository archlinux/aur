# Maintainer: Stefano Aguilera <stefano.aguilera.95@live.cl>
pkgname=monctl
pkgver=1.0
pkgrel=2
pkgdesc="Monitor Control for Gigabyte G27Q"
arch=('any')
url="https://github.com/Gothem/monctl"
license=('MIT')
depends=(qt5-python-bindings python-qtpy python-pyusb)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
    "50-gigabyte-monitor.rules")
sha256sums=('4dccb6c6b7915f2fddb3a9f28e4c3812f62f7ce43b47fa5e3e2baec4b4786337'
    '98eb3014f2577a26582482980c857ae27a2f79adae4ef50abb8bf7476df2f368')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm 644 resources/monctl.desktop "$pkgdir/usr/share/applications/monctl.desktop"
    install -Dm 644 resources/monctl.svg "$pkgdir/usr/share/pixmaps/monctl.svg"
    
    install -Dm 755 resources/monctl "$pkgdir/usr/bin/monctl"

    cd $srcdir
    install -Dm 644 50-gigabyte-monitor.rules "$pkgdir/usr/lib/udev/rules.d/50-gigabyte-monitor.rules"
}
