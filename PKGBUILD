# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=symengine-git
_pkgname=${pkgname%-git}
pkgver=0.8.1.r101.g8be879dd
pkgrel=1
pkgdesc="Fast symbolic manipulation library, written in C++"
url="http://sympy.org/"
arch=(x86_64)
license=(MIT)
depends=(arb boost-libs gmp gperftools primesieve)
makedepends=(cmake git boost)
conflicts=(symengine)
provides=(symengine)
source=(git+https://github.com/sympy/symengine.git)
sha256sums=(SKIP)

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_TCMALLOC=ON \
    -DWITH_PTHREAD=ON \
    -DWITH_SYMENGINE_THREAD_SAFE=ON \
    -DWITH_ARB=ON \
    -DWITH_BOOST=ON \
    -DWITH_PRIMESIEVE=ON \
    -DWITH_LLVM=ON \
    -DWITH_COTIRE=OFF
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
