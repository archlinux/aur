# $Id$
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Filip Dvorak <fila@pruda.com>

pkgname=mingw-w64-enca
pkgver=1.18
pkgrel=1
pkgdesc="Charset analyser and converter (mingw-w64)"
arch=('any')
url="http://cihar.com/software/enca/"
options=('!strip' '!buildflags' 'staticlibs' '!makeflags')
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-recode')
makedepends=('mingw-w64-gcc' 'wine')
source=("http://dl.cihar.com/enca/enca-${pkgver}.tar.xz"
        'configure.patch'
        'tools.patch')
md5sums=('a139a6ba811c375f50947f9c547b3306'
         'ae3503817acea6331b3d443636704c7b'
         'e62da0e6fd31affa1f3e15171dbc95c6')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "${srcdir}/enca-${pkgver}"

    patch -Np1 -i "${srcdir}/configure.patch"
    patch -Np1 -i "${srcdir}/tools.patch"
    ./autogen.sh
    make distclean
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    ${srcdir}/enca-${pkgver}/configure --host=${_arch} \
                --prefix=/usr/${_arch} \
                --libexecdir=/usr/${_arch}/lib \
                --mandir=/usr/${_arch}/share/man \
                --with-librecode=/usr/${_arch} \
                --enable-external
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}

    make DESTDIR="${pkgdir}" install

    rm "${pkgdir}/usr/${_arch}"/bin/*.exe
    rm -r "${pkgdir}/usr/${_arch}/share"
    rm -r "${pkgdir}/usr/${_arch}/lib/enca"

    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}"/bin/*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}"/lib/*.a
  done
}
