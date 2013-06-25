pkgname=mingw-w64-gtk2
pkgver=2.24.19
pkgrel=3
pkgdesc="GTK+ is a multi-platform toolkit (v2) (mingw-w64)"
arch=(any)
url="http://www.gtk.org"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config gtk-update-icon-cache)
depends=(
'mingw-w64-crt'
'mingw-w64-atk'
'mingw-w64-pango'
'mingw-w64-glib2>=2.28.0'
'mingw-w64-cairo'
'mingw-w64-gdk-pixbuf2')
options=(!libtool !strip !buildflags)
source=(
"http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz"
"gtk-dont-define-initguid.patch")

# The second source file is downloaded from Fedora Project

md5sums=("490236abeb0d9351b2a34e9aca70e1de"
         "4038939df90f80ea6923d67afff28e03")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  patch -Np0 < '../gtk-dont-define-initguid.patch'
  for _arch in ${_architectures}; do
    export CFLAGS="-O2 -mms-bitfields"
    export CXXFLAGS="${CFLAGS}"
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    msg "Building for ${_arch}"
    msg "Copying the source directory"
    cp -pr "$srcdir/gtk+-$pkgver/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    if [ $_arch = "x86_64-w64-mingw32" ]; then
      rm "gtk/gtk.def"
    fi
    msg "Starting configure and make"
    ./configure \
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
    rm -r "$pkgdir/usr/${_arch}/"{etc,share}
  done
}
