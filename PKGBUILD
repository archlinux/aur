# Maintainer: epitron <chris AT ill-logic.com>

pkgname=ansilove
pkgver=4.1.5
pkgrel=1
libver=1.2.8
pkgdesc='A program to convert ANSI and artscene related file formats into PNG images'
url='https://ansilove.org/'
license=('BSD')
depends=('gd')
makedepends=('git' 'cmake' 'gcc')
source=(
  "https://github.com/ansilove/ansilove/releases/download/${pkgver}/ansilove-${pkgver}.tar.gz"
  "https://github.com/ansilove/ansilove/releases/download/${libver}/libansilove-${libver}.tar.gz"
)
sha256sums=(
  'dcc6e82fab1587a0f556ee64a6cda9c91dcaaa37306cccc4a4d25f7c96b04d19'
  'ef02eda605e3b38edbeac5874f2de22201db123cb7aab9228fd05cb288d0c0bc'
)
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

