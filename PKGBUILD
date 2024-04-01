# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Peter Hatina <phatina AT gmail.com>
pkgname=lib32-glm
pkgver=1.0.0
pkgrel=3
pkgdesc="C++ mathematics library for 3D software based on the OpenGL Shading Language (GLSL) specification"
arch=('x86_64')
license=('MIT')
url="http://glm.g-truc.net"
depends=('glm')
makedepends=('cmake' 'ninja' 'lib32-gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/g-truc/glm/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('62e22002a6369a54e1f0ee2885a65f2780af7d2a446573e5387b81518f5dc7e8076053837cb99ae850a0166ce8b0f077bed009e8986d9884d01c456ce467553f')

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
