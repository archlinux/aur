# Maintainer: Doug Newgard <dnewgard at outlook dot com>
# Maintainer : David Phillips <dbphillipsnz at gmail>
# Contributor: Ricardo Leuck <leuck.r at gmail> (original brewtarget-git PKGBUILD)

pkgname=brewtarget
pkgver=3.0.9
pkgrel=1
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="http://www.brewtarget.org/"
arch=('x86_64' 'i686')
license=('CCPL:by-sa' 'GPL3' 'LGPL2.1' 'LGPL3' 'WTFPL-2')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'xalan-c' 'xerces-c')
makedepends=('cmake' 'boost' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Brewtarget/brewtarget/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/Brewtarget/brewtarget/commit/96b8fd080aab08cda355290835ebb812b519fcfd.patch")
sha512sums=('7547948bf3d79d68f5ee156a3560e3ba53b45160349d24ebb9ae2086ee5b00bf086830a1bf702d50cd4f7a9385f09afd2e5e742e3e0bc59195448748c8b017ea'
            'ed5c75eb3a79d33b3a9088e9086be3afbd1c4cde41e3e31f6b55c87797855cb12a9f6db5f357a4ce4bed732769a1c8f20edeee4d1c901a301f38fba12cc958a6')

prepare() {
# Disable boost-stacktrace_backtrace, requires an optional boost lib that isn't built on Arch.
  sed -i 's/ COMPONENTS stacktrace_backtrace//' ${pkgname}-${pkgver}/CMakeLists.txt
# More fixes for older databases
  patch -d ${pkgname}-${pkgver} -p1 -i ../96b8fd080aab08cda355290835ebb812b519fcfd.patch
}

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
