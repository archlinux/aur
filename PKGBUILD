# Maintainer: Daniel Pierce <moofed@gmail.com>
# Maintainer: gugah <gugaboy at rocketmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Maxime Morel <maxime@mmorel.eu>

pkgname=opentrack
pkgver=2026.1.0
pkgrel=5
commit=f009bb52cab7bf3884b8a9b3a326aa9ce84d6299
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
source=("https://github.com/opentrack/opentrack/archive/$commit.zip" 
        "opentrack.desktop"
        "opentrack-wayland.desktop"
        "opentrack.install")
sha256sums=('6ca723e1b4fe8ef29ea14ec5ea61311634ec566b6a629dfd0e20601c4a7aaf75'
            'cf717d146a89c7373ec9b393164898db6ea32790f1ce1948c90bc1d4e2f4bb98'
            'b42816a28ecf72a66e6815810cd8565277e77a2eeb1f987e3e046b297170a279'
            '6ed28561a673981dbe3fbb9739ebae890c72486081c93b8049d5744a10b610de')

build() {
  cd opentrack-$commit

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
  cd opentrack-$commit/build
  DESTDIR="$pkgdir" ninja install

  install -Dm644 $srcdir/opentrack.desktop $pkgdir/usr/share/applications/opentrack.desktop
  install -Dm644 $srcdir/opentrack-wayland.desktop $pkgdir/usr/share/applications/opentrack-wayland.desktop
}
