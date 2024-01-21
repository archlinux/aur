# Contributor: Maxime Arthaud <maxime@arthaud.me>

pkgname=ikos
pkgver=3.2
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
	 'ppl'
	 'apron')
makedepends=('cmake'
             'boost'
	     'llvm14')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NASA-SW-VnV/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('11ab520043523a048f8756d68bd3f6a761870d4ec1a9f240eda8f3b1a11f7aa1')

build() {
  cd "$srcdir/ikos-$pkgver"
  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  cd "$srcdir/ikos-$pkgver/build"
  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLLVM_CONFIG_EXECUTABLE="/usr/bin/llvm-config-14" \
    ..
  make
}

check() {
  cd "$srcdir/ikos-$pkgver/build"
  make check
}

package() {
  cd "$srcdir/ikos-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/ikos-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/ikos/LICENSE"
}
