pkgname=mingw-w64-gdk-pixbuf2
pkgver=2.31.2
pkgrel=1
pkgdesc='An image loading library (mingw-w64)'
arch=(any)
url='http://www.gtk.org'
license=('LGPL')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-pkg-config'
  'mingw-w64-configure')
depends=(
  'mingw-w64-crt'
  'mingw-w64-glib2>=2.37.6'
  'mingw-w64-jasper'
  'mingw-w64-libpng'
  'mingw-w64-libjpeg-turbo'
  'mingw-w64-libtiff')
options=(!strip !buildflags staticlibs)
source=(
  "http://download.gnome.org/sources/gdk-pixbuf/${pkgver%.*}/gdk-pixbuf-$pkgver.tar.xz"
  "bug-739441-build-Do-not-include-removed-file-gdk-pixbuf-i18n.h.patch"
  "bug-745402-win32-include-gi18n-lib.h-appropriately.patch")
sha256sums=('9e467ed09894c802499fb2399cd9a89ed21c81700ce8f27f970a833efb1e47aa'
            '05d755b2bc55a7dadc26321bfe67b6a383bc931a6127d90f5dd5d3915c3bd30e'
            '7745276e58843e1be15d1eab49df1c4632e713f3a2fe4b0254c3b0da7370a81b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gdk-pixbuf-${pkgver}"
  patch -Np1 < "../${source[1]}"
  patch -Np1 < "../${source[2]}"
  autoreconf -i
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --with-included-loaders=wbmp,png,pnm,ras,ani,xpm,xbm,tga,icns,pcx,qtif,gdip-ico,gdip-wmf,gdip-emf,gdip-bmp,gdip-gif,gdip-jpeg,gdip-tiff
    make
    cd ..
  done
}

package() {
  cd "${srcdir}/gdk-pixbuf-${pkgver}"
  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
    cd ..
  done
}
