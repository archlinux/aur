# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Filip Dvorak <fila@pruda.com>

pkgname=mingw-w64-enca
pkgver=1.20
pkgrel=1
pkgdesc="Charset analyser and converter (mingw-w64)"
arch=('any')
url="https://cihar.com/software/enca/"
options=('!strip' '!buildflags' 'staticlibs' '!makeflags' '!debug')
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-recode')
makedepends=('git' 'mingw-w64-gcc' 'mingw-w64-wine')
source=(git+https://github.com/nijel/enca#tag=$pkgver
        'enca-bad-file-descriptor.patch'
        'configure.patch'
        'tools.patch'
        'autogen.patch')
sha256sums=('97972fd80faaec6ca9e037745151d8f234756889f515975fe0f908e2eb850790'
            '270c7c0abaea5f3d10173b58849200d4106675d3127a0b9b8ce1fc3dcf775acb'
            '0be6a38cd3920a69c3d6248f79bd3955944b2a3386ac5b4fd3b8b28b6f80ec7d'
            'a06364e8a4c6985353b91e025bf482ff0b9ec57833c3aa0f05316052b7656061'
            '346c7421e8e8f3e7d20264c2d5ce483d79fef12851914cd49ea3d81a611e1a62')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "${srcdir}/enca"

    patch -p1 -i "${srcdir}/enca-bad-file-descriptor.patch" # https://github.com/nijel/enca/issues/28

    patch -Np1 -i "${srcdir}/configure.patch"
    patch -Np1 -i "${srcdir}/tools.patch"
    patch -Np1 -i "${srcdir}/autogen.patch"

    ./autogen.sh
    make distclean
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    ${srcdir}/enca/configure --host=${_arch} \
                --target=${_arch} \
                --prefix=/usr/${_arch} \
                --libexecdir=/usr/${_arch}/lib \
                --mandir=/usr/${_arch}/share/man \
                --with-librecode=/usr/${_arch} \
                --enable-external

    sed -i -e "s/^EXEEXT =/EXEEXT = .exe/" "${srcdir}/build-${_arch}/src/Makefile"

    sed -i "s|#define HAVE_LOCALE_ALIAS 1|/* #undef HAVE_LOCALE_ALIAS */|" "${srcdir}/build-${_arch}/config.h"

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}

    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}/usr/${_arch}/share"
    rm -r "${pkgdir}/usr/${_arch}/lib/enca"

    #FIXME: should fix build scripts
    mv "${pkgdir}/usr/${_arch}/bin/enca.exe.exe" "${pkgdir}/usr/${_arch}/bin/enca.exe"

    ${_arch}-strip -s "${pkgdir}/usr/${_arch}"/bin/*.exe
    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}"/bin/*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}"/lib/*.a
  done
}
