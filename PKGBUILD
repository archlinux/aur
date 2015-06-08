pkgname=mingw-w64-zziplib
pkgver=0.13.62
pkgrel=6
pkgdesc="A lightweight library that offers the ability to easily extract data from files archived in a single zip file (mingw-w64)"
arch=(any)
url="http://zziplib.sourceforge.net"
license=("LGPL, MPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config python2 mingw-w64-sdl)
depends=(mingw-w64-crt mingw-w64-zlib)
optdepends=("mingw-w64-sdl: SDL_rwops for ZZipLib")
options=(staticlibs !strip !buildflags)
source=("http://downloads.sourceforge.net/zziplib/zziplib-${pkgver}.tar.bz2"
"configure.patch")
md5sums=('5fe874946390f939ee8f4abe9624b96c'
         '8c6e3c9526833140cea9390288756114')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir/zziplib-$pkgver"
	patch -Np1 < ../configure.patch
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    export PYTHON=/usr/bin/python2
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-sdl
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}