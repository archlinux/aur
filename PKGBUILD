pkgname=mingw-w64-mman-win32-git
pkgver=r29.2d1c576
pkgrel=1
pkgdesc="A light implementation of the mmap functions (mingw-w64)"
arch=(any)
url="https://github.com/alitrack/mman-win32"
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'git')
provides=('mingw-w64-mman-win32')
conflicts=('mingw-w64-mman-win32')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/alitrack/mman-win32.git")
sha256sums=(SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"      

pkgver() {
  cd "$srcdir/mman-win32"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "$srcdir/mman-win32"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/mman-win32/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
