pkgname=hostapd-wpe
pkgver=2.10.0
pkgrel=1
pkgdesc="Modified hostapd to facilitate AP impersonation attacks"
arch=('i686' 'x86_64')
url="https://w1.fi/hostapd"
license=("BSD")
depends=("openssl-1.0" "libnl" "sqlite")
makedepends=("git")
provides=("hostapd-wpe")
install=install
source=("hostapd-2.10.tar.gz::https://w1.fi/releases/hostapd-2.10.tar.gz"
        "hostapd-2.10-wpe.patch::https://raw.githubusercontent.com/aircrack-ng/aircrack-ng/master/patches/wpe/hostapd-wpe/hostapd-2.10-wpe.patch")
md5sums=("0be43e9e09ab94a7ebf82de0d1c57761" "SKIP")

prepare() {
    cd "${srcdir}/hostapd-2.10"
    patch -p1 -i ${srcdir}/hostapd-2.10-wpe.patch
}

build() {
    cd "${srcdir}/hostapd-2.10/hostapd"
    make
    cp "${srcdir}/hostapd-2.10/hostapd/hostapd" "${srcdir}/hostapd-2.10/hostapd/hostapd-wpe"
    cp "${srcdir}/hostapd-2.10/hostapd/hostapd_cli" "${srcdir}/hostapd-2.10/hostapd/hostapd_cli-wpe"
}

package() {
    # License
    install -Dm644  "${srcdir}/hostapd-2.10/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

    mkdir -p "${pkgdir}/usr/local/bin/"
    cd "${srcdir}/hostapd-2.10/hostapd"
    make DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" wpe
}
