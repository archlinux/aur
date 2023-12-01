pkgname=zedle
pkgver=2023.2
pkgrel=1
pkgdesc="A graphical interface to create, read and modify encrypted Zed! containers."
arch=('x86_64')
url="https://www.primx.eu"
license=('custom')
depends=('qt4' 'icu' 'libldap-2.5')
makedepends=('binutils' 'curl' 'unzip')
source=('https://client.primx.eu/Legal/Terms')
sha256sums=('df3874f72435a8b9b36d043c298db36f46e45f8248e5ed61682761c0f067ada8')

prepare() {
    # No deeplink available, need to submit the form on the website
    curl 'https://client.primx.eu/PublicSoftware/zedlimitededition/' -X POST \
        --data-raw "Version=$pkgver-Linux+Ubuntu-x64" --output "${pkgname^^}.zip"
    unzip -p "${pkgname^^}.zip" "Ubuntu 22.04/${pkgname^^}-$pkgver.Ubuntu22.04.amd64.deb" > "${pkgname^^}.deb"
    rm "${pkgname^^}.zip"
}

package() {
    ar x "${pkgname^^}.deb"
    tar -xvf data.tar.zst -C "$pkgdir"

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
    SHA_SUM=5ff51cf862b93d6e2ae29731065a151e5f21c85d80679a7b06a1cc3ad94302f7
    echo "$SHA_SUM ${pkgname^^}.deb" | sha256sum --check --status
}
