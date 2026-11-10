# Maintainer: epitron <chris AT ill-logic.com>

pkgname=ansilove
pkgver=4.2.3
pkgrel=1
libver=1.4.4
pkgdesc='A program to convert ANSI and artscene related file formats into PNG images'
url='https://ansilove.org/'
license=('BSD')
depends=('gd')
makedepends=('git' 'cmake' 'gcc')
source=(
  "https://github.com/ansilove/ansilove/releases/download/${pkgver}/ansilove-${pkgver}.tar.gz"
  "https://github.com/ansilove/libansilove/releases/download/${libver}/libansilove-${libver}.tar.gz"
)
sha256sums=('18ff3eb554860a7af8b0627f21ee409d30d9552ce650532dd173183fb69e0b42'
            'c07a20bd3bf4d495cc831206ec8fd4a64fdd899241893a771df6776e4109f912')
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
  install -Dm644 "ChangeLog" "${pkgdir}/usr/share/doc/ansilove/ChangeLog"
  cp -r examples "${pkgdir}/usr/share/doc/ansilove/examples/"
}

