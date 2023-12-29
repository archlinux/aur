# Maintainer: Doug Newgard <dnewgard at outlook dot com>
# Maintainer : David Phillips <dbphillipsnz at gmail>
# Contributor: Ricardo Leuck <leuck.r at gmail> (original brewtarget-git PKGBUILD)

pkgname=brewtarget
pkgver=3.0.10
pkgrel=1
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="https://github.com/Brewtarget/brewtarget/"
arch=('x86_64' 'i686')
license=('CCPL:by-sa' 'GPL3' 'LGPL2.1' 'LGPL3' 'WTFPL-2')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'xalan-c' 'xerces-c')
makedepends=('boost' 'cmake' 'meson' 'ninja' 'pandoc' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Brewtarget/brewtarget/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('7d8a7ee24e6b7107da604667d13ab07022c1d934acdb435a5b9757f76ce836fc7d8a313b82069b1e61df8475e3815fcdf45cbfca88609daa62c488e04d6d4bea')

prepare() {
  cd ${pkgname}-${pkgver}

# Disable boost-stacktrace_backtrace, requires an optional boost lib that's only built in Debianland
  sed -i "/boostModules += 'stacktrace_backtrace'/ {N;N;d}" meson.build
# Make libbacktrace not required, we're not running the bt script
  sed -i "/compiler\.find_library('backtrace'/ {n;s/true/false/}" meson.build
# Disable static linking
  sed -i 's/static : true/static : false/g' meson.build
# Don't screw with Arch's build flags
  sed -i '/if compliler.getid/ s/gcc/disable/' meson.build
}

build() {
  meson setup --prefix=/usr ${pkgname}-${pkgver} build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja install -C build
  install -Dm644 "${pkgname}-${pkgver}/"{COPYRIGHT,COPYING.WTFPL} -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
