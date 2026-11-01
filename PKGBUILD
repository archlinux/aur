# Maintainer: haturatu <taro@eyes4you.org>
# The AUR package name is libmmd-cpp because the plain libmmd name is taken by
# an unrelated, deleted package. The installed library, headers and CMake
# package remain libmmd.
pkgname=libmmd-cpp
_basename=libmmd
pkgver=0.3.2
pkgrel=1
pkgdesc="C++20 library for MMD PMX, VMD, animation and physics"
arch=('x86_64')
url="https://github.com/haturatu/libmmd"
license=('MIT')
depends=('bullet' 'glibc' 'libstdc++' 'libgcc')
makedepends=('cmake' 'ninja')
source=("${_basename}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_basename}-${pkgver}.tar.gz")
sha256sums=('c08badc119c274396335af11cf44858e328580a36b35be26566c5b9770e55500')

build() {
  cmake -S "${_basename}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=ON \
    -DLIBMMD_BUILD_TESTS=ON \
    -DLIBMMD_INSTALL=ON \
    -DLIBMMD_ENABLE_PHYSICS=ON \
    -DLIBMMD_ENABLE_BULLET=ON \
    -DLIBMMD_FETCH_DEPENDENCIES=OFF
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
  # Also exercise the installed CMake package and the actual Bullet backend.
  DESTDIR="${srcdir}/stage" cmake --install build
  cmake -S "${_basename}-${pkgver}/tests/package-consumer" -B consumer -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_PREFIX_PATH="${srcdir}/stage/usr" \
    -DLIBMMD_CONSUMER_WITH_BULLET=ON
  cmake --build consumer
  LD_LIBRARY_PATH="${srcdir}/stage/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
    ctest --test-dir consumer --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
