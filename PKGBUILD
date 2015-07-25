# Maintainer: <nontlikeuname at tuta dot io>

pkgname=mingw-w64-atk
pkgver=2.16.0
pkgrel=1
pkgdesc="A library providing a set of interfaces for accessibility (mingw-w64)"
arch=('any')
url="https://developer.gnome.org/atk/"
license=('LGPL')
depends=('mingw-w64-glib2>=2.31.2')
makedepends=('mingw-w64-configure')
options=(!strip !buildflags staticlibs)
source=("http://ftp.gnome.org/pub/gnome/sources/atk/${pkgver:0:4}/atk-${pkgver}.tar.xz")
md5sums=('c7c5002bd6e58b4723a165f1bf312116')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    for _arch in ${_architectures}; do
        mkdir -p ${srcdir}/atk-${pkgver}/build-${_arch}
        cd ${srcdir}/atk-${pkgver}/build-${_arch}
        ${_arch}-configure --disable-glibtest
        make
    done
}

package() {
    for _arch in $_architectures; do
        cd "${srcdir}/atk-${pkgver}/build-${_arch}"
        make DESTDIR="${pkgdir}" install
        find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec rm {} \;
        find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
        find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
        rm -r "${pkgdir}/usr/${_arch}/share"
    done
}

