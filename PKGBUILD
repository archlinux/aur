pkgname=scip-ipopt
pkgver=10.1.0
pkgrel=1
pkgdesc='Solving Constraint Integer Programs'
arch=(x86_64)
url='https://www.scipopt.org/'
license=(Apache-2.0)
provides=('scip')
conflicts=('scip')
options=(!lto !debug)
depends=(bliss
         glibc
         gmp
         libgcc
         libstdc++
         mpfr
         onetbb
         papilo
         readline
         soplex
         coin-or-ipopt
         zlib)
makedepends=(boost
             cmake
             git)
source=("https://github.com/scipopt/scip/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a56b2fa179af35431ca7c3e12ecb7aad3cba8eb08011cacf2b813f8042c07c1')

prepare() {
  cd scip-${pkgver}
  # git cherry-pick -n cc917e074cd23a1630cb0eb4b7f3ec6ba2777d80 # Fix build with glibc 2.43
}

build() {
  cmake -B build -S scip-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DAUTOBUILD=ON \
    -DSYM=bliss \
    -DLTO=OFF -DEXACTSOLVE=OFF -DBUILD_TESTING=OFF -DCMAKE_C_FLAGS_RELEASE="-O2 -DNDEBUG" -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

