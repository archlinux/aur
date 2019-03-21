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
source=("$pkgname-$pkgver.tar.gz::https://github.com/martin3141/tarquin/archive/v$pkgver.tar.gz" "CMakeListsPatch.txt")
md5sums=("9886ccd6eaaa35b7b60a26fd56cafecd" "37e29d28404757eee761507121543609")

prepare() {
  # patch master CMakeLists.txt
  cd "$srcdir"/$pkgname-$pkgver/src
  patch -Np0 -i "$srcdir"/CMakeListsPatch.txt

  # update protobuf files
  cd "$srcdir"/$pkgname-$pkgver/src/common
  protoc tarquin.proto --cpp_out=./
  sed 's/tarquin.pb.h/tarquin_pb.hpp/g' tarquin.pb.cc > tarquin_pb.cpp
  rm tarquin.pb.cc
  mv tarquin.pb.h tarquin_pb.hpp

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
  install -Dm755 "$srcdir/$pkgname-$pkgver/src/build/redist/"tarquin{,gui} -t "$pkgdir"/usr/bin
}
