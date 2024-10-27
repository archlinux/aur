# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=vinecopulib-git
pkgver=r616.23a6ce46
pkgrel=1
pkgdesc="C++ vine copula library"
license=(MIT)
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
depends=(cmake eigen boost libwdm)
makedepends=(cmake)
provides=("lib${pkgname}.so" vinecopulib)
conflics=(vinecopulib)
source=(git+https://github.com/vinecopulib/vinecopulib.git#branch=dev)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/vinecopulib"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd vinecopulib
  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_UNITY_BUILD=ON \
    -DBUILD_TESTING=OFF -DOPT_ASAN=OFF \
    -DVINECOPULIB_SHARED_LIB=ON .
  cmake --build build
}

package() {
  cd vinecopulib
  DESTDIR="${pkgdir}" cmake --build build --target install
}
