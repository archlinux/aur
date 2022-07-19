# Maintainer: Jesse R Codling (jclds139) jclds139 [at] gmail [dot] com
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=libflame-git
pkgver=r105.d10f8bb4
pkgrel=1
pkgdesc="High-performance object-based library for DLA computations"
arch=('i686' 'x86_64')
license=('BSD')
url="https://github.com/flame/libflame"
depends=('gcc-libs' 'blas')
makedepends=('git' 'make' 'gcc')
optdepends=('lapack: high-performance backend for linear algebra')
provides=('libflame')
conflicts=('libflame')
source=("$pkgname::git+https://github.com/flame/libflame.git")
sha1sums=('SKIP')
# options=('staticlibs')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  
  if [ `grep -c sse /proc/cpuinfo` -eq `nproc`]; then
    ENABLE_SSE=--enable-vector-intrinsics=sse
  fi

  # static build is only needed in some cases. We can make a separate -static package if needed
  ./configure --prefix=/usr --enable-dynamic-build $ENABLE_SSE --enable-multithreading=openmp --enable-supermatrix --enable-lapack2flame --enable-max-arg-list-hack
}

build() {
  cd "${pkgname}"
  
  make
}

check() {
  cd "${pkgname}/test"

  sed -i 's/^LIBLAPACK\s\+:=/#\0/' Makefile
    # disable external LAPACK in tests (not enabled in build())
  sed -i 's|^\(LIBBLAS\s\+:=\).*|\1 /usr/lib/libblas.so|' Makefile

  sed -i 's/0\(.*FLA \)/1\1/' input.global.operations
    # enable all libFlame (but not FLASH) tests
  sed -i 's/^i\(\s\+ Reaction to test failure\)/a\1/' input.global.general
    # abort on any test failure

  mkdir obj
  make
  ./test_libflame.x


}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install
}
