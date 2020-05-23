# Maintainer: Uwe Koloska <kolewu@koloro.de>

pkgname=liblomse
_vcsname=lomse
pkgver=0.27.0
pkgrel=1
pkgdesc="A music score renderization/edition library"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/en/lomse/intro"
license=('custom:BSD 2-clause')
groups=('devel')
depends=('freetype2' 'fontconfig')
makedepends=('cmake' 'unittestpp' 'ttf-liberation')

source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/lenmus/lomse/tar.gz/${pkgver}")
sha256sums=('6ed9e3672a55bde7be3469231043394354ad048ca3d9fd812246496d8aa4ec4d')

build() {
  rm -rf build
  mkdir build
  cd build

  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release "../${_vcsname}-${pkgver}"

  make
}

check() {
  cd "${srcdir}/build"
  ./bin/testlib
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}/" make install

  install -D -m644 "${srcdir}/${_vcsname}-${pkgver}/LICENSE" \
	  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove reference to srcdir that is only used for tests
  sed -i -e '/test scores and for fonts/s/s, for test scores and//;/TESTLIB_/d' \
      ${pkgdir}/usr/include/lomse/lomse_config.h
}
