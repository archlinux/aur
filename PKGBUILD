# Maintainer: Daniel Pierce <moofed@gmail.com>
# Maintainer: gugah <gugaboy at rocketmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Maxime Morel <maxime@mmorel.eu>

pkgname=opentrack
pkgver=2023.3.0
pkgrel=2
pkgdesc="Head tracking software"
arch=('x86_64')
url="https://github.com/opentrack/opentrack/"
license=('ISC')
depends=('qt5-base' 'opencv')
makedepends=('cmake' 'xplane-sdk-devel' 'wine' 'ninja' 'qt5-tools' 'procps-ng')
optdepends=('onnxruntime: neuralnet tracker')
source=("https://github.com/opentrack/opentrack/archive/opentrack-$pkgver.tar.gz" 
        "opentrack.desktop"
        "fix-process-list.patch")
sha256sums=('ba5fea9da4b7d70162648e95ba6dcd8bed140519eb607a99a5daf1b00809f824'
            '96b4a633d40f399b927d159353cfaa679d2148156a3f04b5ea23b8d4b8e4bd3f'
            'c5e8d0ae632152350019f56358a92112075eb57fdafaa124b0f781179b6e8ab1')

prepare() {
  cd opentrack-opentrack-$pkgver

  patch -p1 < ../fix-process-list.patch
}

build() {
  cd opentrack-opentrack-$pkgver

  mkdir -p build
  cd build

  # fix path for xplane plugin
  sed -i 's/..\/opentrack-compat\/export.hpp/..\/compat\/export.hpp/' ../x-plane-plugin/plugin.c
  mkdir -p xplane_sdk/CHeaders
  ln -sf /usr/include/xplane_sdk/Wrappers xplane_sdk/CHeaders/
  ln -sf /usr/include/xplane_sdk/Widgets xplane_sdk/CHeaders/
  ln -sf /usr/include/xplane_sdk/XPLM xplane_sdk/CHeaders/
  cmake .. \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -DSDK_XPLANE=xplane_sdk \
      -DSDK_WINE=ON \
      -DONNXRuntime_DIR=/usr/lib/cmake/onnxruntime \
      -DONNXRuntime_INCLUDE_DIR=/usr/include/onnxruntime \
      -DCMAKE_INSTALL_PREFIX=/usr

  ninja
}

package() {
  cd opentrack-opentrack-$pkgver/build
  DESTDIR="$pkgdir" ninja install

  install -Dm644 $srcdir/opentrack.desktop $pkgdir/usr/share/applications/opentrack.desktop
}

