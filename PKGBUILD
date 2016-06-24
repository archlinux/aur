# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann dot de>

pkgname='libqmi-qmi-over-mbim'
pkgver='latest'
pkgrel=1
pkgdesc="QMI modem protocol helper library with experimental qmi-over-mbim patch"
arch=('x86_64')
url='http://www.freedesktop.org/wiki/Software/libqmi/'
license=('GPL2')
depends=('glib2' 'bash')
makedepends=('git' 'gtk-doc' 'libmbim-qmi-over-mbim')
provides=('libqmi')
conflicts=('libqmi')
source=("git+https://cgit.freedesktop.org/libqmi")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


pkgver() {
    cd libqmi
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    cd libqmi
    git checkout qmi-over-mbim
    git pull origin qmi-over-mbim 
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
}
