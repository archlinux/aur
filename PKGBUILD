# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=cosma
_PkgName=COSMA
pkgver=2.6.1
_costaver=2.1
pkgrel=2
pkgdesc="Distributed Communication-Optimal Matrix-Matrix Multiplication Algorithm"
arch=("x86_64")
url="https://github.com/eth-cscs/COSMA"
license=('BSD')
depends=('scalapack' 'cblas')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz"
        costa-$_costaver.tar.gz::"https://github.com/eth-cscs/COSTA/archive/refs/tags/v$_costaver.tar.gz")
sha256sums=('e356bae7082895a90657026bd80a50b589cf7f4f1b257625ee6634c73ce25e05'
            'c1e86452415083f7470b292d93ec60708b7c8dbafc2bac383636bb4b28135866')

prepare() {
  cd "$srcdir/$_PkgName-$pkgver"
  mkdir -p ../build
  sed -i "/adjust_mpiexec_flags/d" CMakeLists.txt
  cp -r ../COSTA-$_costaver/* libs/COSTA
}

build() {
  cd "$srcdir/build"
  cmake ../"$_PkgName-$pkgver" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_EXE_LINKER_FLAGS="-lcblas" \
          -DBUILD_SHARED_LIBS=ON \
          -DCOSMA_WITH_TESTS=OFF \
          -DCOSMA_BLAS=CUSTOM \
          -DCOSMA_SCALAPACK=CUSTOM \
          -DSCALAPACK_BLAS=CUSTOM \
          -DMPIEXEC_PREFLAGS='--oversubscribe'
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 "$srcdir/$_PkgName-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname"
  rm -rf "$pkgdir/usr/bin"
}
