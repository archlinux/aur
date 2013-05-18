pkgname=mingw-w64-gtk2
pkgver=2.24.18
pkgrel=1
pkgdesc="GTK+ is a multi-platform toolkit (v2) (mingw-w64)"
arch=(any)
url="http://www.gtk.org"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt
mingw-w64-atk
mingw-w64-pango
mingw-w64-glib2
mingw-w64-cairo
mingw-w64-gdk-pixbuf2)
options=(!libtool !strip !buildflags)
source=(
"http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz"
"http://pkgs.fedoraproject.org/cgit/mingw-gtk2.git/plain/gtk-dont-define-initguid.patch?id=3224e445dad240da5f5ebfe371e8c9f627459089")
md5sums=('4309379acdcd8abfb72ea89bce3e7746'
		"4038939df90f80ea6923d67afff28e03")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  patch -Np0 < '../gtk-dont-define-initguid.patch?id=3224e445dad240da5f5ebfe371e8c9f627459089'
  for _arch in ${_architectures}; do
    export CFLAGS="-O2 -mms-bitfields"
    export CXXFLAGS="${CFLAGS}"
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cp -r "$srcdir/gtk+-$pkgver/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
#    if [ $_arch = "x86_64-w64-mingw32" ]; then
#      rm "gtk/gtk.def"
#    fi
    ${srcdir}/gtk+-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --with-gdktarget=win32 \
      --disable-modules \
      --disable-cups \
      --with-included-loaders=png,bmp,ico,pnm,xpm \
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
    rm -r "$pkgdir/usr/${_arch}/"{etc,share}
  done
}
