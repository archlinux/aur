# Maintainer: drakkan <nicola.murino@gmail.com>
pkgname=mingw-w64-gst-plugins-base
pkgver=1.10.2
pkgrel=2
pkgdesc="GStreamer Multimedia Framework Base Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-glib2' 'mingw-w64-libxml2' 'mingw-w64-gstreamer')
options=('!strip' '!buildflags' 'staticlibs')
makedepends=(mingw-w64-configure mingw-w64-gstreamer bison flex python2 mingw-w64-opus mingw-w64-libvorbis mingw-w64-pango mingw-w64-libtheora)

source=("${url}/src/gst-plugins-base/gst-plugins-base-${pkgver}.tar.xz")
sha256sums=('fbc0d40fcb746d2efe2ea47444674029912f66e6107f232766d33b722b97de20')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gst-plugins-base-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --with-package-name="GStreamer Base Plugins (Arch Linux)" \
      --with-package-origin="http://www.archlinux.org/" \
      --disable-examples \

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
   
    make
    cd ..
  done
}


package() {
  cd "${srcdir}/gst-plugins-base-${pkgver}"

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

# vim: ts=2 sw=2 et:
