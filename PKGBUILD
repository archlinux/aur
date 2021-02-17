# Maintainer: Uwe Koloska <kolewu@koloro.de>

pkgname=liblomse
_vcsname=lomse
pkgver=0.28.0
pkgrel=1
pkgdesc="A music score renderization/edition library"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/en/lomse/intro"
license=('custom:BSD 2-clause')
groups=('devel')
depends=('freetype2' 'fontconfig' 'zlib' 'libpng')
makedepends=('cmake' 'unittestpp' 'ttf-liberation')

source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/lenmus/lomse/tar.gz/${pkgver}")
sha256sums=('01d27e2fe4634a05c0981224e00b1355477151fd35eabfd2f5ff4a7525726114')

build() {
  rm -rf build
  mkdir build
  cd build

  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr -DLOMSE_RUN_TESTS=no \
	-DCMAKE_BUILD_TYPE=Release "../${_vcsname}-${pkgver}"

  make
}

check() {
  cd "${srcdir}/build"
  ./testlib
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
