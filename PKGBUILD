# Maintainer: epitron <chris AT ill-logic.com>

pkgname=ansilove
pkgver=4.2.0
pkgrel=1
libver=1.4.1
pkgdesc='A program to convert ANSI and artscene related file formats into PNG images'
url='https://ansilove.org/'
license=('BSD')
depends=('gd')
makedepends=('git' 'cmake' 'gcc')
source=(
  "https://github.com/ansilove/ansilove/releases/download/${pkgver}/ansilove-${pkgver}.tar.gz"
  "https://github.com/ansilove/libansilove/releases/download/${libver}/libansilove-${libver}.tar.gz"
)
sha256sums=('a2f24918ffe01332ea18b2ffab2da4ccad55c7e4a4edcf1c64a1c017d2e4e930'
            'c6aa32bcef54b05b9af535c621f7044156295a49cea3cfaf1c868e359be59203')
arch=('x86_64' 'i686')

build() {
  cd "${srcdir}/libansilove-${libver}"
  cmake . -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr"
  make

  cd "${srcdir}/ansilove-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" -DANSILOVE_INCLUDE_DIRS=../libansilove-${libver}/include/ -D ANSILOVE_LIBRARIES=../libansilove-${libver}/libansilove.so .
  make
}

package() {
  cd "${srcdir}/libansilove-${libver}"
  make install

  cd "${srcdir}/ansilove-${pkgver}"
  make install

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/ansilove/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/ansilove/README.md"
}

