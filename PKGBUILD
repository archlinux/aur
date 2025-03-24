# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Ivan Semkin (ivan at semkin dot ru)

pkgname=qt5-pim-git
pkgver=r1029.f9a8f0fc
pkgrel=1
pkgdesc='Qt Personal Information Management'
url='http://code.qt.io/cgit/qt/qtpim.git'
arch=(x86_64)
license=(GPL3 FDL custom)
conflicts=(qt5-pim)
provides=(qt5-pim)
depends=(qt5-declarative)
makedepends=(git)
source=(git+https://code.qt.io/qt/qtpim.git#commit=f9a8f0fc914c040d48bbd0ef52d7a68eea175a98
        0001-Patch-module-version.patch)
sha512sums=('d253f84e2e1ad1435b56413a3751be8d5e9ec7c5f68a045cf6bcded4970657bc234ab973806c999f773dae72c20ff1c5067fa3ae7d81ec6f310b7ec776b0de80'
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
