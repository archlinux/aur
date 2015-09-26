pkgname=mingw-w64-libmikmod
pkgver=3.3.6
pkgrel=1
pkgdesc="A portable sound library (mingw-w64)"
arch=(any)
url="http://mikmod.shlomifish.org"
license=("GPL, LGPL")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt mingw-w64-openal)
options=(staticlibs !strip !buildflags)
source=("http://downloads.sourceforge.net/mikmod/libmikmod-$pkgver.tar.gz")
sha256sums=('3f363e03f7b1db75b9b6602841bbd440ed275a548e53545f980df8155de4d330')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libmikmod-$pkgver"
  sed -i "s,#define HAVE_SSE2,,g" "include/mikmod_internals.h"
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    export CFLAGS="$CFLAGS -DDLL_EXPORTS"
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-threads=win32 \
      --enable-openal
    sed -i "s,-Dunix,-DWIN32,g" Makefile
    sed -i "s,#define DRV_PIPE 1,,g" "config.h"
    sed -i "s,typedef unsigned int[ ]*ULONG;,typedef unsigned long ULONG;,g" "include/mikmod.h"
    sed -i "s,typedef unsigned int[ ]*ULONG;,typedef unsigned long ULONG;,g" "include/mikmod_build.h"
    make
  done
}

package() {
  install -d "$pkgdir/usr/bin"
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
    ln -s "/usr/${_arch}/bin/libmikmod-config" "$pkgdir/usr/bin/${_arch}-libmikmod-config"
  done
}
