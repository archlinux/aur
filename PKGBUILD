
pkgname=mingw-w64-asmjit
pkgver=r102.d7fc62d
pkgrel=1
pkgdesc="Complete x86/x64 JIT and Remote Assembler for C++ (mingw-w64)"
arch=('any')
url="https://github.com/kobalicek/asmjit"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'git')
options=('!buildflags' 'staticlibs' '!strip')
source=("git+https://github.com/kobalicek/asmjit.git")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/asmjit"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "$srcdir/asmjit"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DASMJIT_STATIC=ON \
      ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/asmjit/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "$srcdir/asmjit/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

