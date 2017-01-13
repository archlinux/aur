# Maintainer: drakkan <nicola dot murino at gmail.com>
pkgname=mingw-w64-gst-plugins-ugly
pkgver=1.10.2
pkgrel=2
pkgdesc="GStreamer Multimedia Framework Ugly Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
makedepends=('mingw-w64-configure' 'mingw-w64-gstreamer' 'mingw-w64-x264' 'mingw-w64-lame' 'mingw-w64-opencore-amr')
depends=('mingw-w64-glib2' 'mingw-w64-gstreamer' 'mingw-w64-gst-plugins-base' 'mingw-w64-orc')
options=('!strip' '!buildflags' 'staticlibs')

source=(${url}/src/gst-plugins-ugly/gst-plugins-ugly-${pkgver}.tar.xz)
sha256sums=('f303dd4c2ebc963e8b0b03c3069f70657bcf1cd62224d344ad579b3dda17ec9d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "${srcdir}/gst-plugins-ugly-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --with-package-name="GStreamer Ugly Plugins (Arch Linux)" \
      --with-package-origin="http://www.archlinux.org/" \
      --disable-examples \

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
    cd ..
  done
}


package() {
  cd "${srcdir}/gst-plugins-ugly-${pkgver}"

  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="${pkgdir}" install

    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.a
    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.la
    rm -rf "$pkgdir"/usr/${_arch}/share/${aclocal,man,locale}

    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;

    cd ..
  done
}

# vim: ts=2 sw=2 et:
