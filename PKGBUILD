# Maintainer: <nontlikeuname at tuta dot io>

pkgname=mingw-w64-atk
pkgver=2.18.0
pkgrel=1
pkgdesc="A library providing a set of interfaces for accessibility (mingw-w64)"
arch=('any')
url="https://developer.gnome.org/atk/"
license=('LGPL')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-glib2')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://ftp.gnome.org/pub/gnome/sources/atk/${pkgver:0:4}/atk-${pkgver}.tar.xz")
md5sums=('fd3678f35004b4c92e3da39356996054')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd "${srcdir}/atk-${pkgver}/"
    for _arch in ${_architectures}; do
        mkdir -p build-${_arch} && pushd build-${_arch}
        ${_arch}-configure --disable-glibtest
        make
        popd
    done
}

package() {
    for _arch in ${_architectures}; do
        cd ${srcdir}/atk-${pkgver}/build-${_arch}
        make DESTDIR="${pkgdir}" install
        ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
        ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
        rm -r ${pkgdir}/usr/${_arch}/share
    done
}

