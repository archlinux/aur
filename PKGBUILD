# based on: https://aur.archlinux.org/packages/libqmi-qmi-over-mbim/

pkgname='libqmi-qmi-over-mbim-netctl'
pkgver='1.0.0'
pkgrel=4
pkgdesc="QMI modem protocol helper library with experimental qmi-over-mbim patch"
arch=('x86_64')
url='http://www.freedesktop.org/wiki/Software/libqmi/'
license=('GPL2')
depends=('glib2' 'bash' 'iproute2')
makedepends=('git' 'gtk-doc' 'libmbim-qmi-over-mbim')
provides=('libqmi')
conflicts=('libqmi')
source=("git+https://cgit.freedesktop.org/libqmi"
        "0001-Added-QMI_OVER_MBIM-config-option.patch"
        "0002-Added-FCC_AUTH-option.patch"
        "0003-Added-STATIC_IP-option-to-configure-non-DHCP-network.patch"
        "qmi")
md5sums=('SKIP'
        "379023e2e68bab23dc294c7c600d1d9d"
        "5773778a63f7a77b0112e888055c1d09"
        "79ccc3075ff1628d63ef7af756dd19c5"
        "f5d7b11b118b876b1e6f1af3f256c900")
pkgdir='pkg'
srcdir='src'


prepare() {
    cd libqmi
    git checkout qmi-over-mbim
    git pull origin qmi-over-mbim
    git apply ${srcdir}/0001-Added-QMI_OVER_MBIM-config-option.patch
    git apply ${srcdir}/0002-Added-FCC_AUTH-option.patch
    git apply ${srcdir}/0003-Added-STATIC_IP-option-to-configure-non-DHCP-network.patch
}


build() {
    cd libqmi
    ./autogen.sh --enable-mbim-qmux --prefix=/usr
}


package() {
    cd libqmi
    make DESTDIR="${pkgdir}/" install
    libtool --finish "${pkgdir}/usr/lib"
    # Fix file name for ModemManager
    ln "${pkgdir}/usr/lib/libqmi-glib.so" "${pkgdir}/usr/lib/libqmi-glib.so.1"
    mkdir -p "${pkgdir}/usr/lib/network/connections/"
    cp ${srcdir}/qmi "${pkgdir}/usr/lib/network/connections/"
}
