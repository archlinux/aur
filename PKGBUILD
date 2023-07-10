# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=ikos
pkgver=3.1
pkgrel=1
pkgdesc='Static analyzer for C and C++ developed by NASA'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/nasa-sw-vnv/ikos'
license=('custom:NOSA 1.3')
depends=('gmp'
         'boost-libs'
         'python'
         'python-pygments'
         'sqlite'
         'intel-tbb'
         'llvm14'
         'llvm14-libs'
         'clang14'
         'apron')
makedepends=('cmake'
             'boost'
	     'llvm14')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NASA-SW-VnV/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e2a9ff32d02aeff92abbb8f69f1a6730ad96b6f59a10e18c30522d033f950844')

prepare() {
  cd "$srcdir/ikos-$pkgver"
  [[ -d build ]] && rm -rf build
  mkdir build && cd build
}

build() {
  cd "$srcdir/ikos-$pkgver/build"
  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLLVM_CONFIG_EXECUTABLE="/usr/bin/llvm-config-14" \
    ..
  make
}

package() {
  cd "$srcdir/ikos-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/ikos-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/ikos/LICENSE"
}

check() {
  cd "$srcdir/ikos-$pkgver/build"
  make check
}
