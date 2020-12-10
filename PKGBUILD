# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calculator-git
pkgver=1.5.5.r105.g5d3c275
pkgrel=1
pkgdesc='The Pantheon Calculator'
arch=('i686' 'x86_64')
url='https://github.com/elementary/calculator'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so')
makedepends=('git' 'granite' 'intltool' 'meson' 'vala')
provides=('pantheon-calculator')
conflicts=('pantheon-calculator')
source=('pantheon-calculator::git+https://github.com/elementary/calculator.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-calculator
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  sed 's/extra/io.elementary.calculator.extra/' -i pantheon-calculator/po/extra/meson.build
}

build() {
  cd build

  meson ../pantheon-calculator \
    --buildtype='release' \
    --prefix='/usr'
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
