# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Peter Hatina <phatina AT gmail.com>
pkgname=lib32-glm
pkgver=1.0.1
pkgrel=1
pkgdesc="C++ mathematics library for 3D software based on the OpenGL Shading Language (GLSL) specification"
arch=('x86_64')
license=('MIT')
url="http://glm.g-truc.net"
depends=('glm')
makedepends=('cmake' 'ninja' 'lib32-gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/g-truc/glm/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('c6c6fa1ea7a7e97820e36ee042a78be248ae828c99c1b1111080d9bf334a5160c9993a70312351c92a867cd49907c95f9f357c8dfe2bc29946da6e83e27ba20c')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export CXXFLAGS+=" -ffat-lto-objects"

  cmake -S glm-${pkgver} -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_DATAROOTDIR=/usr/lib32/cmake \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -W no-dev
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  rm -rf "$pkgdir"/usr/include

  install -vDm 644 glm-${pkgver}/copying.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
