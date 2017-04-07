
pkgname=mingw-w64-dlfcn
pkgver=1.0.0
pkgrel=3
pkgdesc="A wrapper for dlfcn to the Win32 API (mingw-w64)"
arch=(any)
url="https://github.com/dlfcn-win32/dlfcn-win32"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/dlfcn-win32/dlfcn-win32/archive/v${pkgver}.tar.gz")
md5sums=('fc9882d8e33d06626ddb22b44c6fd4dd')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"      

prepare() {
  cd "$srcdir/dlfcn-win32-$pkgver"

  # https://github.com/dlfcn-win32/dlfcn-win32/pull/6
  sed -i "s|\-Wall \-O3 \-fomit\-frame\-pointer|\-O2 \-g \-pipe \-Wall \-Wp,\-D_FORTIFY_SOURCE=2 \-fexceptions \-\-param=ssp\-buffer\-size=4|g" Makefile

  # https://github.com/dlfcn-win32/dlfcn-win32/pull/7
  sed -i "s|libdl.dll libdl.dll.a|libdl.dll|g" Makefile
}

build()
{
  cd "$srcdir/dlfcn-win32-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    unset LDFLAGS
    ../configure \
      --prefix=/usr/${_arch} \
      --libdir=/usr/${_arch}/lib \
      --incdir=/usr/${_arch}/include \
      --disable-stripping \
      --enable-shared \
      --disable-msvc \
      --cross-prefix=${_arch}-
    cp ../Makefile ../dlfcn.c ../dlfcn.h .
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
