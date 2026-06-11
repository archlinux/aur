# Maintainer: Daniel Pierce <moofed@gmail.com>
# Maintainer: gugah <gugaboy at rocketmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Maxime Morel <maxime@mmorel.eu>

pkgname=opentrack
pkgver=2026.1.0
pkgrel=4
pkgdesc="Head tracking software"
arch=('x86_64')
url="https://github.com/opentrack/opentrack/"
license=('ISC')
depends=('qt6-base' 'qt6-5compat' 'opencv')
makedepends=('cmake' 'xplane-sdk-devel' 'wine' 'ninja' 'qt6-tools' 'qt6-declarative' 'procps-ng')
optdepends=('onnxruntime: ONNX support for neuralnet tracker'
            'libgomp: OpenMP support for neuralnet tracker (GCC)'
            'openmp: OpenMP support for neuralnet tracker (Clang)')
install=opentrack.install
source=("https://github.com/opentrack/opentrack/archive/opentrack-$pkgver.tar.gz" 
        "opentrack.desktop"
        "opentrack-wayland.desktop"
        "tracker-neuralnet.patch"
        "impl-camera.patch"
        "opentrack.install")
sha256sums=('90f2e5dee2b3c4875dd5464008826f234ec761bb20204567e81575da961a8fda'
            'cf717d146a89c7373ec9b393164898db6ea32790f1ce1948c90bc1d4e2f4bb98'
            'b42816a28ecf72a66e6815810cd8565277e77a2eeb1f987e3e046b297170a279'
            '782d4733e846cd3b45b57f3a95a5dea934020e9f40cabb105ac8e0e69525b535'
            'a5a0bee5af734ec8954fc11cfd1bd543292057a0870ce35037915f9c5bc7f560'
            '6ed28561a673981dbe3fbb9739ebae890c72486081c93b8049d5744a10b610de')

prepare() {
  cd opentrack-opentrack-$pkgver

  patch -Np1 -i "$srcdir/tracker-neuralnet.patch"
  patch -Np1 -i "$srcdir/impl-camera.patch"
}

build() {
  cd opentrack-opentrack-$pkgver

  # Color codes for warnings, if output is a terminal
  if [ -t 1 ]; then
    _RED='\033[0;31m'
    _NC='\033[0m' # No Color
  else
    _RED=''
    _NC=''
  fi

  # Check for onnxruntime
  if ! pkg-config --exists onnxruntime 2>/dev/null && [ ! -d "/usr/include/onnxruntime" ]; then
    echo -e "${_RED}WARNING: onnxruntime not found. Neuralnet tracker support will not be available.${_NC}"
  fi

  # Check for OpenMP libraries
  if [ ! -f "/usr/lib/libomp.so" ] && [ ! -f "/usr/lib/libgomp.so.1" ]; then
    echo -e "${_RED}WARNING: OpenMP library not found. Neuralnet tracker support will not be available.${_NC}"
  fi

  mkdir -p build
  cd build

  # Fix X-Plane SDK path
  mkdir -p xplane_sdk/CHeaders
  ln -sf /usr/include/xplane_sdk/Wrappers xplane_sdk/CHeaders/
  ln -sf /usr/include/xplane_sdk/Widgets  xplane_sdk/CHeaders/
  ln -sf /usr/include/xplane_sdk/XPLM     xplane_sdk/CHeaders/
  export ONNXRuntime_ROOT=/usr
  cmake .. \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -DSDK_XPLANE=xplane_sdk \
      -DSDK_WINE=ON \
      -DONNXRuntime_DIR=/usr/lib/cmake/onnxruntime \
      -DCMAKE_INSTALL_PREFIX=/usr

  ninja
}

package() {
  cd opentrack-opentrack-$pkgver/build
  DESTDIR="$pkgdir" ninja install

  install -Dm644 $srcdir/opentrack.desktop $pkgdir/usr/share/applications/opentrack.desktop
  install -Dm644 $srcdir/opentrack-wayland.desktop $pkgdir/usr/share/applications/opentrack-wayland.desktop
}
