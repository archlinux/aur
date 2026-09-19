# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=vinecopulib
pkgver=1.0.0
pkgrel=1
pkgdesc="C++ vine copula library"
license=(MIT)
arch=(x86_64)
url="https://github.com/${pkgname}/${pkgname}"
depends=(gcc-libs)
makedepends=(cmake eigen boost libwdm r)
provides=("lib${pkgname}.so")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('36c3899f5981d697091853f4742cb6c99bda9ae72ac4d10c97f3df31e79ac97866a1f09d4122761858476a65bb09c3286b3aa18973c38460b0369e0a885da80b')

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
