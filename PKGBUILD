
pkgname=mingw-w64-dlfcn
pkgver=1.1.2
pkgrel=1
pkgdesc="A wrapper for dlfcn to the Win32 API (mingw-w64)"
arch=(any)
url="https://github.com/dlfcn-win32/dlfcn-win32"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/dlfcn-win32/dlfcn-win32/archive/v${pkgver}.tar.gz")
sha256sums=('a4ff75ffa4b8ce90b4be923da69045b2077bba780f792b29f6f46d52d68cbc50')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"      

build()
{
  cd "$srcdir/dlfcn-win32-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/dlfcn-win32-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
