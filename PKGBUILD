pkgname=mingw-w64-librsvg
pkgver=2.40.16
pkgrel=1
pkgdesc="A SVG viewing library (mingw-w64)"
arch=(any)
url="https://live.gnome.org/LibRsvg"
license=("LGPL")
makedepends=(mingw-w64-configure gdk-pixbuf2 intltool setconf)
depends=(mingw-w64-gdk-pixbuf2 mingw-w64-pango mingw-w64-libcroco)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnome.org/pub/gnome/sources/librsvg/${pkgver%.*}/librsvg-$pkgver.tar.xz")
sha256sums=('d48bcf6b03fa98f07df10332fb49d8c010786ddca6ab34cbba217684f533ff2e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd librsvg-$pkgver
	CXXFLAGS+=" -D_POSIX_SOURCE"
	CFLAGS+=" -D_POSIX_SOURCE"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-introspection \
      --disable-tools
		setconf Makefile AM_CFLAGS '-fno-common'
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/librsvg-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
