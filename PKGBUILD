# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-editing-services
pkgver=1.10.3
pkgrel=1
pkgdesc="GStreamer editing services (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gstreamer' 'mingw-w64-gst-plugins-base')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')

source=("${url}/src/gstreamer-editing-services/gstreamer-editing-services-${pkgver}.tar.xz")
sha256sums=('bcbf52ad789be44abc6bb68c96457683438b2a1d966a3f408c8c931ae2c2a32b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gstreamer-editing-services-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --with-package-name="GStreamer editing services (Arch Linux)" \
      --with-package-origin="http://www.archlinux.org/" 

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
    cd ..
  done
}

package() {
  cd "${srcdir}/gstreamer-editing-services-${pkgver}"

  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="${pkgdir}" install

    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.a
    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.la
    rm -rf "$pkgdir"/usr/${_arch}/share/bash-completion

    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;

    cd ..
  done
}

# vim: ts=2 sw=2 et:
