# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-rtsp-server
pkgver=1.10.4
pkgrel=1
pkgdesc="RTSP server library based on GStreamer (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gst-plugins-base')
options=('!strip' '!buildflags' 'staticlibs')
makedepends=('mingw-w64-configure')

source=("${url}src/gst-rtsp-server/gst-rtsp-server-${pkgver}.tar.xz")
sha256sums=('2f6e12fd4e3568ee190dc24e57e4c3a878971c3a3fb6904a9674404fac256de6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gst-rtsp-server-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --with-package-name="GStreamer RTSP Server Library (Arch Linux)" \
      --with-package-origin="http://www.archlinux.org/" 

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
    cd ..
  done
}

package() {
  cd "${srcdir}/gst-rtsp-server-${pkgver}"

  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="${pkgdir}" install

    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.a
    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.la

    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;

    cd ..
  done
}

# vim: ts=2 sw=2 et:
