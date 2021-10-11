# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=standardese-git
pkgver=0.5.2.r11.g457b264
pkgrel=5
pkgdesc="A (work-in-progress) nextgen Doxygen for C++"
arch=('i686' 'x86_64')
url="https://github.com/standardese/standardese"
license=('MIT')
depends=('clang>=3.7.1' 'boost-libs>=1.55' 'llvm')
makedepends=('git' 'cmake' 'boost>=1.55' 'cmark')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/standardese/standardese.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  rm -rf build
  mkdir build
  cd build

  # Statically link dependencies
  cmake \
    -DBUILD_SHARED_LIBS=OFF \
    -DSTANDARDESE_BUILD_TEST=OFF \
    -DCMAKE_BUILD_TYPE=none \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DLIBCLANG_INCLUDE_DIR="/usr/include/" \
    -DLIBCLANG_SYSTEM_INCLUDE_DIR="$(find /usr/lib/clang/ -type d -name include)" \
    ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make install
  install -D -m644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
