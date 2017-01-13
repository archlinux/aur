# Maintainer: drakkan <nicola dot murino at gmail.com>
pkgname=mingw-w64-gst-libav
pkgver=1.10.2
pkgrel=2
pkgdesc="GStreamer Multimedia Framework ffmpeg Plugin (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-glib2' 'mingw-w64-libxml2' 'mingw-w64-gstreamer' 'mingw-w64-gst-plugins-base')
makedepends=('mingw-w64-configure' 'mingw-w64-gstreamer' 'mingw-w64-gst-plugins-base')
options=('!strip' '!buildflags' 'staticlibs')

source=("${url}/src/gst-libav/gst-libav-${pkgver}.tar.xz")
sha256sums=('a3dd7036211f061e1eda04f985b7a9dd1a91b754f767ff2587eb6ec28f44e73c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gst-libav-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --with-package-name="GStreamer ffmpeg Plugin (Arch Linux)" \
      --with-package-origin="http://www.archlinux.org/" 

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
    cd ..
  done
}

package() {
  cd "${srcdir}/gst-libav-${pkgver}"

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
