# Maintainer: Uwe Koloska <kolewu@koloro.de>

pkgname=liblomse
_vcsname=lomse
pkgver=0.30.0
pkgrel=1
pkgdesc="A music score renderization/edition library"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/en/lomse/intro"
license=('MIT')
groups=('devel')
depends=('freetype2' 'fontconfig' 'zlib' 'libpng')
makedepends=('cmake' 'unittestpp' 'ttf-liberation')

source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/lenmus/lomse/tar.gz/${pkgver}"
		"001-add_missing_include.patch")
sha256sums=('d0c83c628f32310fa2df6285eeed16e66d71825532dda753573fa09774441e36'
            '3020063450eaee727717aff68aaabeaa434d1479dac7aca1d0f012ff5ee71d91')

prepare() {
  cd "${_vcsname}-${pkgver}"
  patch -p1 -i "$srcdir"/001-add_missing_include.patch
}

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
