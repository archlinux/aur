# Maintainer: Doug Newgard <dnewgard at outlook dot com>
# Maintainer : David Phillips <dbphillipsnz at gmail>
# Contributor: Ricardo Leuck <leuck.r at gmail> (original brewtarget-git PKGBUILD)

pkgname=brewtarget
pkgver=3.0.7
pkgrel=1
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="http://www.brewtarget.org/"
arch=('x86_64' 'i686')
license=('CCPL:by-sa' 'GPL3' 'LGPL2.1' 'LGPL3' 'WTFPL-2')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'xalan-c' 'xerces-c')
makedepends=('cmake' 'boost' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Brewtarget/brewtarget/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2af31920be2bc3961e60fa6539cd95304ba1abc5460e643d3c514f947c206eaa577503345bff70f9bf7286303a45c67c39e2ef845d6ee3ff48fb5bbe4f1b02e8')

prepare() {
# Disable boost-stacktrace_backtrace, requires an optional boost lib that isn't built on Arch.
  sed -i 's/ COMPONENTS stacktrace_backtrace//' ${pkgname}-${pkgver}/CMakeLists.txt
}
build() {
  mkdir -p "${pkgname}-build"
  cd "${pkgname}-build"
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DNO_MESSING_WITH_FLAGS=ON
  make
}

package() {
  cd "${pkgname}-build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../${pkgname}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -Dm644 "../${pkgname}-${pkgver}/COPYING.WTFPL" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.WTFPL"
}
