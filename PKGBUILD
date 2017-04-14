# $Id$
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Filip Dvorak <fila@pruda.com>

pkgname=mingw-w64-enca
pkgver=1.19
pkgrel=2
pkgdesc="Charset analyser and converter (mingw-w64)"
arch=('any')
url="http://cihar.com/software/enca/"
options=('!strip' '!buildflags' 'staticlibs' '!makeflags')
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-recode')
makedepends=('mingw-w64-gcc' 'wine')
source=("http://dl.cihar.com/enca/enca-${pkgver}.tar.xz"
        'configure.patch'
        'tools.patch'
	'autogen.patch')
md5sums=('a7a0c152658e012db701a48ae8b79525'
         'ae3503817acea6331b3d443636704c7b'
         'e62da0e6fd31affa1f3e15171dbc95c6'
         '4c55e12e639524c584c436bfc93e4b11')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "${srcdir}/enca-${pkgver}"

    patch -Np1 -i "${srcdir}/configure.patch"
    patch -Np1 -i "${srcdir}/tools.patch"
    patch -Np1 -i "${srcdir}/autogen.patch"
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

    rm -r "${pkgdir}/usr/${_arch}/share"
    rm -r "${pkgdir}/usr/${_arch}/lib/enca"

    ${_arch}-strip -s "${pkgdir}/usr/${_arch}"/bin/*.exe
    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}"/bin/*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}"/lib/*.a
  done
}
