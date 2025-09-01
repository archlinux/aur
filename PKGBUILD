# Maintainer: John Wason <wason@wasontech.com>
pkgbase=robotraconteur
pkgname=(librobotraconteurcore1 librobotraconteur-devel python-robotraconteur robotraconteurgen)
pkgver=1.2.6
pkgrel=1
pkgdesc="Robot Raconteur is a communication framework for Robotics and Automation"
arch=('x86_64' 'aarch64')
url="https://github.com/robotraconteur/robotraconteur"
license=('Apache-2.0')
source=("https://github.com/robotraconteur/robotraconteur/releases/download/v${pkgver}/RobotRaconteur-${pkgver}-Source.tar.gz")
sha256sums=('ad6a3429ec009240f4e208b983da46ba576a1936b1031ffd9003ecf3797fcd98')
makedepends=(
  'cmake>=3.5.1'
  'boost>=1.58.0'
  'bluez-libs'
  'dbus'
  'openssl'
  'libusb'
  'zlib'
  'python'
  'python-numpy'
  'python-setuptools'
  'python-pip'
  'gtest'
  'base-devel'
)
_libdepends=('bluez-libs' 'dbus' 'libusb')
_pythondepends=('python' 'python-numpy')

prepare() {
  cd "RobotRaconteur-${pkgver}-Source"
  rm -rf build
  mkdir build
}

build() {
  cd "RobotRaconteur-${pkgver}-Source/build"
  cmake ..     -DCMAKE_INSTALL_PREFIX=/usr     -DCMAKE_BUILD_TYPE=Release     -DBUILD_GEN=ON     -DBUILD_PYTHON=OFF     -DBUILD_PYTHON3=ON     -DUSE_PREGENERATED_SOURCE=ON     -DPYTHON3_EXECUTABLE=/usr/bin/python3     -DINSTALL_PYTHON3_PIP=ON     -DBUILD_DOCUMENTATION=OFF     -DBUILD_SHARED_LIBS=ON     -DROBOTRACONTEURCORE_SOVERSION_MAJOR_ONLY=ON     -DCMAKE_SKIP_RPATH=ON     -DROBOTRACONTEUR_TESTING_DISABLE_DISCOVERY_LOOPBACK=ON     -DBUILD_TESTING=OFF     -DINSTALL_PYTHON3_PIP_EXTRA_ARGS="--compile --use-pep517 --no-build-isolation --no-deps --root-user-action=ignore"
  cmake --build . -- -j$(nproc)
}

package_librobotraconteurcore1() {
  pkgdesc="Robot Raconteur runtime library"
  depends=("${_libdepends[@]}")
  cd "$srcdir/RobotRaconteur-${pkgver}-Source/build"
  DESTDIR="$pkgdir" cmake --install .
  # Prune unrelated files
  find "$pkgdir/usr/lib" -maxdepth 1 -type d -name "python*" -exec rm -r {} +
  rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib/cmake" "$pkgdir/usr/bin" "$pkgdir/usr/share" "$pkgdir/usr/lib/pkgconfig"
  find "$pkgdir/usr/lib" -type f,l ! -name 'libRobotRaconteurCore.so.*' -delete
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_librobotraconteur-devel() {
  pkgdesc="Robot Raconteur development files"
  depends=('librobotraconteurcore1' 'boost>=1.58.0' 'cmake' 'base-devel' 'openssl' 'robotraconteurgen')
  cd "$srcdir/RobotRaconteur-${pkgver}-Source/build"
  DESTDIR="$pkgdir" cmake --install .
  # Keep only headers, development symlinks, and cmake files
  find "$pkgdir/usr/lib" -maxdepth 1 -type d -name "python*" -exec rm -r {} +
  find "$pkgdir/usr/lib" -type f,l ! -name 'libRobotRaconteurCore.so' ! -name '*.cmake' -delete
  rm -rf "$pkgdir/usr/bin" "$pkgdir/usr/share" "$pkgdir/usr/lib/pkgconfig"
  find "$pkgdir/usr/lib" -type f,l -name 'libRobotRaconteurCore.so.*' -delete
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-robotraconteur() {
  pkgdesc="Robot Raconteur Python 3 module"
  depends=("${_libdepends[@]}" "${_pythondepends[@]}")
  cd "$srcdir/RobotRaconteur-${pkgver}-Source/build"
  DESTDIR="$pkgdir" cmake --install .
  # Prune to only python site-packages
  pyver=$(python3 -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')
  sitepkg="usr/lib/python${pyver}/site-packages"
  find "$pkgdir/usr" -mindepth 1 -maxdepth 1 ! -name "lib" -exec rm -rf {} +
  find "$pkgdir/usr/lib" -mindepth 1 -maxdepth 1 ! -name "python${pyver}" -exec rm -rf {} +
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_robotraconteurgen() {
  pkgdesc="RobotRaconteurGen tool"
  depends=('librobotraconteurcore1')
  cd "$srcdir/RobotRaconteur-${pkgver}-Source/build"
  DESTDIR="$pkgdir" cmake --install .
  # Keep only the generator binary and man page (if present)
  find "$pkgdir/usr" -mindepth 1 -maxdepth 1 ! -name "bin" -a ! -name "share" -exec rm -rf {} +
  find "$pkgdir/usr/bin" -type f ! -name 'RobotRaconteurGen' -delete
  if [ -d "$pkgdir/usr/share/man/man1" ]; then
    find "$pkgdir/usr/share/man/man1" -type f ! -name 'robotraconteurgen*' -delete
  fi
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
