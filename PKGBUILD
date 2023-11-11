# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=symengine-git
_pkgname=${pkgname%-git}
pkgver=0.11.1.r9.g9b2526ffe
pkgrel=1
pkgdesc="Fast symbolic manipulation library, written in C++"
url="http://sympy.org/"
arch=(x86_64)
license=(MIT)
depends=(boost-libs flint gmp gmp-ecm gperftools libmpc mpfr primesieve)
makedepends=(cmake git boost cereal)
conflicts=(symengine)
provides=(symengine)
source=(git+https://github.com/sympy/symengine.git
        llvm-shared.patch
        flint-3.patch)
sha256sums=('SKIP'
            'ef05a806139b35e0336f00cb6960ef6cf483f11b0041e436a99ab1f46bdcb11c'
            'd82743b3893ca208ec63b1f7722b54c065c9d821bf612e99b0cdf7c5c7da8700')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  patch -d $_pkgname -p1 < llvm-shared.patch # Use shared LLVM (Gentoo)
  patch -d $_pkgname -p1 < flint-3.patch # Fix build with flint 3
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_TCMALLOC=ON \
    -DWITH_PTHREAD=ON \
    -DWITH_SYMENGINE_THREAD_SAFE=ON \
    -DWITH_ARB=ON \
    -DWITH_ECM=ON \
    -DWITH_LLVM=OFF \
    -DWITH_MPFR=ON \
    -DWITH_MPC=ON \
    -DWITH_PRIMESIEVE=ON \
    -DWITH_BOOST=ON \
    -DWITH_COTIRE=OFF \
    -DWITH_SYSTEM_CEREAL=ON
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
