pkgname=zedle
pkgver=2022.2
pkgrel=1
pkgdesc="A graphical interface to create, read and modify encrypted Zed! containers."
arch=('x86_64')
url="https://www.primx.eu"
license=('custom')
depends=('qt4' 'icu' 'libldap24')
makedepends=('binutils' 'curl')
source=('https://client.primx.eu/Legal/Terms')
sha256sums=('1da53b13fe274dc9de9e8c27d7af8b328f4c04f19e4f62a50350f55eeb0850eb')

prepare() {
    # No deeplink available, need to submit the form on the website
    curl 'https://client.primx.eu/PublicSoftware/zedlimitededition/' -X POST \
        --data-raw "Version=$pkgver-Linux+Ubuntu-x64" --output "${pkgname^^}-$pkgver.Ubuntu18.04.amd64.deb"
}

package() {
    ar x "${pkgname^^}-$pkgver.Ubuntu18.04.amd64.deb"
    tar -xvf data.tar.xz -C "$pkgdir"

    # Change directory permissions from 775 to 755
    chmod 755 -R "$pkgdir/usr"

    install -dm1777 "$pkgdir/etc/primx/accessfiles"
    install -dm1777 "$pkgdir/var/log/zed"

    touch "$pkgdir/etc/primx/users.registry"
    chmod 666 "$pkgdir/etc/primx/users.registry"

    install -Dm644 "$srcdir/Terms" -t "$pkgdir/usr/share/licenses/$pkgname/Terms.html"
}

check() {
    # SHA verification needs to be done manually because the file is downloaded manually as well
    SHA_SUM=48de866df9743d61d1d017f0480620e5af9baf00315ae570392f44b2e2e36477
    echo "$SHA_SUM ${pkgname^^}-$pkgver.Ubuntu18.04.amd64.deb" | sha256sum --check --status
}
