# $Id$
# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Yamashita Ren <lemaitre.lotus@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

pkgname=mingw-w64-dcadec
pkgver=0.1.0
pkgrel=4
pkgdesc='DTS Coherent Acoustics decoder with support for HD extensions (mingw-w64)'
arch=('any')
url='https://github.com/foo86/dcadec.git'
license=('LGPL2.1')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=(!strip !buildflags staticlibs)
source=("dcadec-${pkgver}.tar.gz::https://github.com/foo86/dcadec/archive/v${pkgver}.tar.gz")
sha256sums=('52a68a63f79ae50e5e5fd9c631a715e9feeed5d2b4a8442f0b9208692012a43f')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    cp -r "${srcdir}/dcadec-${pkgver}" "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}

    export CONFIG_WINDOWS='TRUE'
    export AR="${_arch}-ar"
    export CC="${_arch}-gcc"

    make
    CONFIG_SHARED='TRUE' make

  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}

    export CONFIG_WINDOWS='TRUE'
    export AR="${_arch}-ar"
    export CC="${_arch}-gcc"
    export PREFIX="/usr/${_arch}"

    make DESTDIR="${pkgdir}" install
    CONFIG_SHARED='TRUE' make DESTDIR="${pkgdir}" install
    mv "${pkgdir}"/usr/${_arch}/lib/*.dll "${pkgdir}"/usr/${_arch}/bin/
    mv "${srcdir}"/build-${_arch}/libdcadec/*.a "${pkgdir}"/usr/${_arch}/lib/
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
