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
source=(git+https://code.qt.io/qt/qtpim.git
        0001-Patch-module-version.patch)
sha512sums=('SKIP'
            '6e7d43f36bbf23dedd860727259a4bf5dfad8e8548a3d4a19c974b9afed87ebb25264cc08572bdbb0f703c95ae1a5f6a7a5ca8cd742feaf46440fe7c282535d2')

pkgver() {
  cd qtpim
  # Upstream has one tag but it's from 2012
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir build
  cd qtpim
  patch -Np1 -i ../0001-Patch-module-version.patch
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
