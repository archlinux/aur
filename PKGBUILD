# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=mingw-w64-async++-git
pkgver=r187.172ca3f
pkgrel=1
pkgdesc="Async++ is a lightweight concurrency framework for C++11. (mingw-w64)"
arch=('any')
url='https://github.com/Amanieu/asyncplusplus'
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname%-git}::git+https://github.com/Amanieu/asyncplusplus.git#branch=master")
sha1sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/${pkgname%-git}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/${pkgname%-git}/build-${_arch}"
    make DESTDIR="$pkgdir" install 
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
 
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
