# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=cosma
_PkgName=COSMA
pkgver=2.5.1
_costaver=2.0
pkgrel=1
pkgdesc="Distributed Communication-Optimal Matrix-Matrix Multiplication Algorithm"
arch=("x86_64")
url="https://github.com/eth-cscs/COSMA"
license=('BSD')
depends=('scalapack')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz"
        costa-$_costaver.tar.gz::"https://github.com/eth-cscs/COSTA/releases/download/v2.0/COSTA-v2.0.tar.gz")
sha256sums=('593d764056cc27d3d2188a22bc830684498c86f572bfed570b0ffd980839962a'
            'de250197f31f7d23226c6956a687c3ff46fb0ff6c621a932428236c3f7925fe4')

prepare() {
  cd "$srcdir/$_PkgName-$pkgver"
  mkdir ../build
  sed -i "/adjust_mpiexec_flags/d" CMakeLists.txt
  cp -r ../COSTA-v$_costaver/* libs/COSTA
}

build() {
  cd "$srcdir/build"
  cmake ../"$_PkgName-$pkgver" \
          -DCMAKE_INSTALL_PREFIX=/usr \
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
  install -m755 "$srcdir/$_PkgName-$pkgver/LICENCE" \
    "$pkgdir/usr/share/licenses/$pkgname"
  rm -rf "$pkgdir/usr/bin"
}
