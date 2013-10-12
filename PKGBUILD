pkgname=mingw-w64-gtk2
pkgver=2.24.22
pkgrel=2
pkgdesc="GTK+ is a multi-platform toolkit (v2) (mingw-w64)"
arch=(any)
url="http://www.gtk.org"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config gtk-update-icon-cache)
depends=(
'mingw-w64-crt'
'mingw-w64-atk>=1.29.2'
'mingw-w64-pango>=1.20'
'mingw-w64-glib2>=2.28.0'
'mingw-w64-cairo>=1.6'
'mingw-w64-gdk-pixbuf2>=2.21.0')
options=(!libtool !strip !buildflags)
source=(
"http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz")

md5sums=("5fbbfb7637bbd571a572a2dae0e736d2")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  for _arch in ${_architectures}; do
    export CFLAGS="-O2 -mms-bitfields"
    export CXXFLAGS="${CFLAGS}"
    unset LDFLAGS
    msg "Building for ${_arch}"
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    rm "${srcdir}/gtk+-${pkgver}/gtk/gtk.def"
    msg "Starting configure and make"
    ${srcdir}/gtk+-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --with-gdktarget=win32 \
      --disable-modules \
      --disable-cups \
      --disable-papi \
      --enable-static \
      --enable-shared \
      --disable-glibtest
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make -j1 DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.manifest' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/etc"
    rm -r "$pkgdir/usr/${_arch}/share/gtk-2.0"
  done
}
