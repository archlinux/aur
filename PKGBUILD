pkgname=hostapd-wpe
pkgver=2.9.1
pkgrel=2
pkgdesc="Modified hostapd to facilitate AP impersonation attacks"
arch=('i686' 'x86_64')
url="https://w1.fi/hostapd"
license=("BSD")
depends=("openssl-1.0" "libnl" "sqlite")
makedepends=("git")
provides=("hostapd-wpe")
install=install
source=("hostapd-2.9.tar.gz::https://w1.fi/releases/hostapd-2.9.tar.gz"
        "hostapd-2.9-wpe.patch::https://raw.githubusercontent.com/aircrack-ng/aircrack-ng/master/patches/wpe/hostapd-wpe/hostapd-2.9-wpe.patch")
md5sums=("f188fc53a495fe7af3b6d77d3c31dee8" "SKIP")

prepare() {
    cd "${srcdir}/hostapd-2.9"
    patch -p1 -i ${srcdir}/hostapd-2.9-wpe.patch
}

build() {
    cd "${srcdir}/hostapd-2.9/hostapd"
    make
}

package() {
    # License
    install -Dm644  "${srcdir}/hostapd-2.9/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

    mkdir -p "${pkgdir}/usr/local/bin/"
    cd "${srcdir}/hostapd-2.9/hostapd"
    make DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" wpe
}
