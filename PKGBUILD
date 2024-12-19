# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=vinecopulib-git
pkgver=r623.14fafd70
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

prepare() {
  cd "$srcdir/vinecopulib"
  sed -i "1iinclude(FetchContent)" cmake/findDependencies.cmake
  sed -i "s|wdm Boost::|Boost::|g" cmake/buildTargets.cmake

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
