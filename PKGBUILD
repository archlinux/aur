# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=libwebm
pkgver=1.0.0.30
pkgrel=1
pkgdesc="WebM video file parser"
url="https://www.webmproject.org/"
arch=('x86_64' 'aarch64')
license=('BSD')
makedepends=('cmake')
source=("https://github.com/webmproject/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        cmake_install.patch)
sha256sums=('6c1381fd1a66e86e095b76028ede696724e198ea0e39957c9649af5f0718b96a'
            '3cb2b2a2e8bba4fcdf496e1981c927742dd86dcc25c3112a9faa45e711736e5f')

prepare() {
  mkdir -p build
  cd $pkgname-$pkgname-$pkgver
  patch -p1 -i ../cmake_install.patch
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_IWYU=ON \
    -DENABLE_WEBM_PARSER=ON \
    ../$pkgname-$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  cd ../$pkgname-$pkgname-$pkgver
  install -Dm644 LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
