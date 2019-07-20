# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Ivan Semkin (ivan at semkin dot ru)

pkgname=qt5-pim-git
pkgver=r1020.8fec622c
pkgrel=1
pkgdesc='Qt Personal Information Management'
url='http://code.qt.io/cgit/qt/qtpim.git'
arch=(x86_64)
license=(GPL3 FDL custom)
conflicts=(qt5-pim)
provides=(qt5-pim)
depends=(qt5-declarative)
makedepends=(git)
source=(git+https://code.qt.io/qt/qtpim.git)
sha512sums=('SKIP')

pkgver() {
  cd qtpim
  # Upstream has one tag but it's from 2012
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir build
}

build() {
  cd build
  qmake-qt5 ../qtpim
  make
}

check() {
  cd build
  make check TESTARGS="-silent"
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir/" install

  # Drop QMAKE_PRL_BUILD_DIR because it references the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
