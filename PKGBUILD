# Maintainer: John Wason <wason@wasontech.com>
pkgbase=robotraconteur-companion
pkgname=(librobotraconteur-companion0.4 librobotraconteur-companion-devel)
pkgver=0.4.2
pkgrel=1
pkgdesc="Robot Raconteur C++ Companion Library"
arch=('x86_64' 'aarch64')
url="https://github.com/robotraconteur/robotraconteur_companion"
license=('Apache-2.0')
source=("https://github.com/robotraconteur/robotraconteur_companion/releases/download/v${pkgver}/RobotRaconteurCompanion-${pkgver}-Source.tar.gz")
sha256sums=('0b49f7ad7e3decc7ca6b9fb20c245f809dfae2ebcd67a934aac66804ee27ecff')
makedepends=(
  'cmake>=3.5.1'
  'boost>=1.58.0'
  'openssl'
  'zlib'
  'gtest'
  'base-devel'
  'yaml-cpp'
  'eigen'
  'librobotraconteur-devel'
  'robotraconteurgen'
)
_libdepends=()

prepare() {
  cd "RobotRaconteurCompanion-${pkgver}-Source"
  rm -rf build
  mkdir build
}

build() {
  cd "RobotRaconteurCompanion-${pkgver}-Source/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_DOCUMENTATION=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DROBOTRACONTEUR_COMPANION_SOVERSION_MAJOR_ONLY=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_TESTING=OFF
  cmake --build . -- -j$(nproc)
}

package_librobotraconteur-companion0.4() {
  pkgdesc="Robot Raconteur C++ companion runtime library"
  depends=("${_libdepends[@]}")
  cd "$srcdir/RobotRaconteurCompanion-${pkgver}-Source/build"
  DESTDIR="$pkgdir" cmake --install .
  # Prune unrelated files
  rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib/cmake" "$pkgdir/usr/bin" "$pkgdir/usr/share" "$pkgdir/usr/lib/pkgconfig"
  find "$pkgdir/usr/lib" -type f,l ! -name 'libRobotRaconteurCompanion.so.*' -delete
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_librobotraconteur-companion-devel() {
  pkgdesc="Robot Raconteur C++ companion development files"
  depends=('librobotraconteur-companion0.4' 'boost>=1.58.0' 'cmake' 'base-devel' 'openssl' 'yaml-cpp' 'eigen' 'librobotraconteur-devel' 'robotraconteurgen')
  cd "$srcdir/RobotRaconteurCompanion-${pkgver}-Source/build"
  DESTDIR="$pkgdir" cmake --install .
  # Keep only headers, development symlinks, and cmake files
  find "$pkgdir/usr/lib" -type f,l ! -name 'libRobotRaconteurCompanion.so' ! -name '*.cmake' -delete
  rm -rf "$pkgdir/usr/bin" "$pkgdir/usr/lib/pkgconfig"
  # Keep only /usr/share/robotraconteur directory
  find "$pkgdir/usr/share" -mindepth 1 -maxdepth 1 ! -name 'robotraconteur' -exec rm -rf {} +
  find "$pkgdir/usr/lib" -type f,l -name 'libRobotRaconteurCompanion.so.*' -delete
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
