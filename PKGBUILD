# Maintainer: edubart <edub4rt@gmail.com>
_basename=gperftools
pkgname=mingw-w64-gperftools
pkgver=2.5
pkgrel=1
pkgdesc="Fast, multi-threaded malloc and nifty performance analysis tools (mingw-w64)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gperftools/"
license=('BSD')
depends=('perl')
options=(!strip !buildflags)
source=("git+https://github.com/gperftools/gperftools#tag=$_basename-$pkgver")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  unset LDFLAGS
  cd "$_basename"
  ./autogen.sh
}

build() {
  cd "$_basename"
  unset LDFLAGS
  export CXXFLAGS="-Wno-narrowing"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}
    cd build-${_arch}
    ${_arch}-configure --enable-frame-pointers
    cp src/config.h ../src/config.h
    make
    cd ..
  done
}

package() {
  cd "$_basename"
  unset LDFLAGS

  for _arch in ${_architectures}; do
    cd build-${_arch}
    make DESTDIR="$pkgdir" install
    cd ..
  done
}

# vim:set ts=2 sw=2 et: