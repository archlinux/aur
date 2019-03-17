# Maintainer: Martin Wilson <martin at pipegrep dot co dot uk> 

pkgname=tarquin
pkgver=4.3.12
pkgrel=1
pkgdesc="An analysis tool for automatically determining the quantities of molecules present in MR spectroscopy data"
arch=("x86_64")
url="http://tarquin.sourceforge.net/"
license=("GPL")
depends=("lapack" "protobuf" "fftw" "gnuplot" "qwt5")
makedepends=("cmake" "gcc-fortran" "boost")
source=("https://github.com/martin3141/tarquin/archive/v$pkgver.tar.gz")
md5sums=("9886ccd6eaaa35b7b60a26fd56cafecd")

prepare() {
  # patch master CMakeLists.txt
  cd "$srcdir"/$pkgname-$pkgver/src
  patch -Np0 -i ../../../CMakeListsPatch.txt
  # update protobuf files
  cd "$srcdir"/$pkgname-$pkgver/src/common
  ./gen_proto.sh
  # make the build directory
  cd "$srcdir"/$pkgname-$pkgver/src
  mkdir -p build
}

build() {
  cd "$srcdir"/$pkgname-$pkgver/src/build
  cmake -DCMAKE_BUILD_TYPE=Release ../ 
  make
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  cp "$srcdir"/$pkgname-$pkgver/src/build/redist/tarquin "$pkgdir"/usr/bin
  cp "$srcdir"/$pkgname-$pkgver/src/build/redist/tarquingui "$pkgdir"/usr/bin
}
