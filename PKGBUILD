
pkgname=mingw-w64-dlfcn
pkgver=1.3.1
pkgrel=1
pkgdesc="A wrapper for dlfcn to the Win32 API (mingw-w64)"
arch=(any)
url="https://github.com/dlfcn-win32/dlfcn-win32"
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/dlfcn-win32/dlfcn-win32/archive/v${pkgver}.tar.gz")
sha256sums=('f7248a8baeb79d9bcd5f702cc08a777431708758e70d1730b59674c5e795e88a')

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
