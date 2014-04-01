pkgname=mingw-w64-gdk-pixbuf2
pkgver=2.30.7
pkgrel=1
pkgdesc="An image loading library (mingw-w64)"
arch=(any)
url="http://www.gtk.org"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt
'mingw-w64-glib2>=2.37.6'
mingw-w64-jasper
mingw-w64-libpng
mingw-w64-libjpeg-turbo
mingw-w64-libtiff)
options=(!strip !buildflags staticlibs)
source=("http://download.gnome.org/sources/gdk-pixbuf/${pkgver%.*}/gdk-pixbuf-$pkgver.tar.xz")
sha256sums=('0aafc365eab1083a53f15e4828333b968219ffcb1a995ac6289c0147c9ffad06')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    export CFLAGS="-O2 -pipe -mms-bitfields"
    export CXXFLAGS="${CFLAGS}"
    export CXX=$_arch-g++
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/gdk-pixbuf-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-static \
      --enable-shared \
      --with-included-loaders=wbmp,png,pnm,ras,ani,xpm,xbm,tga,icns,pcx,qtif,gdip-ico,gdip-wmf,gdip-emf,gdip-bmp,gdip-gif,gdip-jpeg,gdip-tiff
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
