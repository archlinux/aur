# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-gtk3
pkgver=3.8.2
pkgrel=2
pkgdesc="GTK+ is a multi-platform toolkit (v3) (mingw-w64)"
arch=(any)
url="http://www.gtk.org"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config gtk-update-icon-cache)
depends=(
'mingw-w64-crt'
'mingw-w64-atk>=2.7.5'
'mingw-w64-pango>=1.32.4'
'mingw-w64-glib2>=2.35.3'
'mingw-w64-cairo>=1.10.0'
'mingw-w64-gdk-pixbuf2>=2.27.1')
options=(!libtool !strip !buildflags)

source=(
"http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz"
"https://git.gnome.org/browse/gtk+/plain/demos/gtk-demo/brick.png?h=gtk-3-8&id=231d6c209f47edac828f52a7316980129c370eb1"
"gtk-dont-define-initguid.patch")

# The second source file is downloaded from GNOME. This file exists in the git repository but not in the tarball. Building of demos will fail without this file.
# The third source file is downloaded from Fedora Project

md5sums=('8e878e18fc385f2b813419dc7b40a968'
        '523aea0be651baaba128c133751a0f01'
        '4038939df90f80ea6923d67afff28e03')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  patch -Np0 < '../gtk-dont-define-initguid.patch'
  for _arch in ${_architectures}; do
    export CFLAGS="-O2 -mms-bitfields"
    export CXXFLAGS="${CFLAGS}"
    unset LDFLAGS
    export PKG_CONFIG_FOR_BUILD="${_arch}-pkg-config"
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    msg "Copying files"
    cp -r "${srcdir}/gtk+-${pkgver}/"* \
      "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cp '../brick.png?h=gtk-3-8&id=231d6c209f47edac828f52a7316980129c370eb1' \
      "${srcdir}/gtk+-${pkgver}/demos/gtk-demo/brick.png"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    if [ $_arch = "x86_64-w64-mingw32" ]; then
      rm "gtk/gtk.def"
    fi
    msg "Starting configure and make"
    ${srcdir}/gtk+-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-win32-backend \
      --enable-gtk2-dependency \
      --enable-static \
      --enable-shared \
      --disable-cups \
      --with-included-immodules
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
