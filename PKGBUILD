# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=vinecopulib
pkgver=1.0.1
pkgrel=1
pkgdesc="C++ vine copula library"
license=(MIT)
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
depends=(gcc-libs)
makedepends=(cmake eigen boost libwdm r)
provides=("lib${pkgname}.so")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f6abd2d8c20cff6dbb3aeba48518ffd2865f8ef0723d6df839afdb0138910cdd4abfc38679f8f8e643b275109f4dc3d62fc844c359c1f3a245063c3d405751f8')

prepare() {
  cd ${pkgname}-${pkgver}
  # eigen 5.x compatibility
  sed -i 's|EIGEN3_FOUND|Eigen3_FOUND|g' cmake/findDependencies.cmake
}

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=11 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DBUILD_TESTING=OFF \
    -DOPT_ASAN=ON \
    -DVINECOPULIB_PRECOMPILED=ON \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
