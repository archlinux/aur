# Maintainer: BlackCherry <blackcherry at danwin1210 dot de>

_pkgname=raylib
pkgname=$_pkgname-wayland
pkgver=6.2
pkgrel=1
pkgdesc='Simple and easy-to-use game programming library. Wayland backend'
arch=(x86_64)
url='https://www.raylib.com'
license=(Zlib)
depends=(wayland libxkbcommon glu glfw)
makedepends=(cmake git vulkan-headers wayland-protocols)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/raysan5/raylib#tag=$pkgver")
b2sums=('5d4ef7f4650eda6b048167ba82202dbae7964ba1af668678444c1bbd4e0158352f93eb786cfd18c80532610658b5e5c7b0c15407832bc47f9467c42d0760b3a9')

build() {
  cmake \
    -B build \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_SHARED_LIBS=ON \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_FLAGS="$CFLAGS -fPIC -w" \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D OpenGL_GL_PREFERENCE=GLVND \
    -D PLATFORM=Desktop \
    -D USE_EXTERNAL_GLFW=ON \
    -D GLFW_BUILD_WAYLAND=ON \
    -D WITH_PIC=ON \
    -S $_pkgname \
    -W no-dev
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
  # Include files that are used in the raylib examples
  for f in rcamera rgestures; do
    install -Dm644 $_pkgname/src/$f.h "$pkgdir/usr/include/$f.h"
  done
  install -Dm644 $_pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
