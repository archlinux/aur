# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Peter Hatina <phatina AT gmail.com>
pkgname=lib32-glm
pkgver=1.0.3
pkgrel=1
pkgdesc="C++ mathematics library for 3D software based on the OpenGL Shading Language (GLSL) specification"
arch=('x86_64')
license=('MIT')
url="http://glm.g-truc.net"
depends=('glm')
makedepends=('cmake' 'ninja' 'lib32-gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/g-truc/glm/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('0a490f0c79cd4a8ba54f37358f8917cef961dab9e61417c84ae0959c61bc860e5b83f4fb7f27169fb3d08eef1d84131bddde23d60876922310205c901b1273aa')

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
