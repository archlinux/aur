pkgname=mingw-w64-gst-plugins-good
pkgver=1.6.0
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Good Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-glib2' 'mingw-w64-libxml2')
options=('!strip' '!buildflags' 'staticlibs')
makedepends=(mingw-w64-configure mingw-w64-gstreamer bison flex python2)

source=(${url}/src/gst-plugins-good/gst-plugins-good-${pkgver}.tar.xz)
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "${srcdir}/gst-plugins-good-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --with-package-name="GStreamer Good Plugins (Arch Linux)" \
      --with-package-origin="http://www.archlinux.org/" \
      --disable-examples \
	  --disable-x \
  	  --disable-aalib \
	  --disable-aalibtest 

    make
    cd ..
  done
}


package() {
  cd "${srcdir}/gst-plugins-good-${pkgver}"

  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="${pkgdir}" install

    rm $pkgdir/usr/$_arch/lib/gstreamer-1.0/*.a
    rm $pkgdir/usr/$_arch/lib/gstreamer-1.0/*.la
    rm -rf "$pkgdir/usr/${_arch}/share/{aclocal,man}"

    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;

    cd ..
  done
}
