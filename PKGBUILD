# Maintainer: Angelo Theodorou <encelo@gmail.com>

pkgname=ncine
pkgver=2019.10
pkgrel=1
pkgdesc="A multi-platform 2D game engine"
arch=('i686' 'x86_64')
url="http://ncine.github.io"
license=('MIT')
depends=('glfw' 'openal' 'libvorbis' 'libwebp' 'hicolor-icon-theme')
optdepends=('glew' 'lua')
makedepends=('git' 'cmake' 'doxygen')
options=(!strip)
source=('https://github.com/nCine/nCine/archive/2019.10.tar.gz')
md5sums=('2598a2f357e465e5cd51c0ac30757d66')

prepare() {
  git clone https://github.com/nCine/nCine-data || git -C nCine-data pull
}

build() {
  mkdir -p build && cd build

  cmake ../nCine-$pkgver\
        -DCMAKE_BUILD_TYPE=Release\
        -DNCINE_BUILD_TESTS=ON\
        -DNCINE_INSTALL_DEV_SUPPORT=ON\
        -DNCINE_LINKTIME_OPTIMIZATION=ON\
        -DNCINE_AUTOVECTORIZATION_REPORT=OFF\
        -DNCINE_DYNAMIC_LIBRARY=ON\
        -DNCINE_BUILD_DOCUMENTATION=ON\
        -DNCINE_IMPLEMENTATION_DOCUMENTATION=OFF\
        -DNCINE_EMBED_SHADERS=ON\
        -DNCINE_STARTUP_TEST=apptest_camera\
        -DNCINE_BUILD_ANDROID=OFF\
        -DNCINE_STRIP_BINARIES=ON\
        -DNCINE_TESTS_DATA_DIR=/usr/share/ncine/data\
        -DNCINE_ADDRESS_SANITIZER=OFF\
        -DNCINE_GCC_HARDENING=ON\
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=$pkgdir PREFIX= install
  install -Dm0644 $srcdir/nCine-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
