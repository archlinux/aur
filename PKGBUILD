# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-plugins-base
pkgver=1.10.4
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Base Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gstreamer' 'mingw-w64-orc')
makedepends=('mingw-w64-configure' 'mingw-w64-opus' 'mingw-w64-libvorbis' 'mingw-w64-pango' 'mingw-w64-libtheora' 'mingw-w64-libvisual')
options=('!strip' '!buildflags' 'staticlibs')

source=("${url}/src/gst-plugins-base/gst-plugins-base-${pkgver}.tar.xz")
sha256sums=('f6d245b6b3d4cb733f81ebb021074c525ece83db0c10e932794b339b8d935eb7')

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

    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.a
    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.la
    rm -rf "$pkgdir"/usr/${_arch}/share/{aclocal,man,locale}

    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;
    find "$pkgdir" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;

    cd ..
  done
}

# vim: ts=2 sw=2 et:
