# $Id$
# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: EVorster <evorster@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

pkgname=mingw-w64-vid.stab
pkgver=1.1
pkgrel=4
pkgdesc='Video stabilization library (mingw-w64)'
arch=('any')
url='http://public.hronopik.de/vid.stab'
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'git')
options=(!strip !buildflags staticlibs)
_hash='2d82492533bf5004bc2c4f8213a1b622c45f6a44'
source=("vid.stab-${pkgver}::git+https://github.com/georgmartius/vid.stab.git#commit=${_hash}")
sha256sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd vid.stab-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}

    # build shared libs
    ${_arch}-cmake "${srcdir}/vid.stab-${pkgver}" \
      -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
      -DBUILD_SHARED_LIBS:BOOL=ON
    make

    # build static libs
    ${_arch}-cmake "${srcdir}/vid.stab-${pkgver}" \
      -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
      -DBUILD_SHARED_LIBS:BOOL=OFF
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}

    # install shared libs
    ${_arch}-cmake "${srcdir}/vid.stab-${pkgver}" \
      -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
      -DBUILD_SHARED_LIBS:BOOL=ON
    make DESTDIR="${pkgdir}" install

    # install static libs
    ${_arch}-cmake "${srcdir}/vid.stab-${pkgver}" \
      -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
      -DBUILD_SHARED_LIBS:BOOL=OFF
    make DESTDIR="${pkgdir}" install

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
