# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-rtsp-server
pkgver=1.14.4
pkgrel=1
pkgdesc="RTSP server library based on GStreamer (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gst-plugins-base')
options=('!strip' '!buildflags' 'staticlibs')
makedepends=('mingw-w64-configure')

source=("${url}src/gst-rtsp-server/gst-rtsp-server-${pkgver}.tar.xz")
sha256sums=('3d0ece2afdcd601c175ece24e32a30bc19247b454f4eafd3deeec2533c6884f1')

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
