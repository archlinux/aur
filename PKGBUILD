# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-plugins-good
pkgver=1.14.4
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Good Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gst-plugins-base' 'mingw-w64-orc' 'mingw-w64-bzip2')
makedepends=('python' 'mingw-w64-configure' 'mingw-w64-libsoup' 'mingw-w64-cairo' 'mingw-w64-gdk-pixbuf2' 'mingw-w64-libvpx' 'mingw-w64-speex' 'mingw-w64-flac' 'mingw-w64-wavpack' 'mingw-w64-mpg123' 'mingw-w64-lame')
optdepends=(
  "mingw-w64-libsoup: libsoup HTTP client source/sink plugin"
  "mingw-w64-cairo: Cairo overlay plugin"
  "mingw-w64-gdk-pixbuf2: gdk-pixbuf image decoder, overlay, and sink plugin"
  "mingw-w64-libpng: PNG image codec plugin"
  "mingw-w64-libjpeg-turbo: JPEG image codec plugin"
  "mingw-w64-libvpx: VP8 and VP9 video codec plugin"
  "mingw-w64-speex: Speex audio codec plugin"
  "mingw-w64-flac: FLAC audio codec plugin"
  "mingw-w64-wavpack: Wavpack audio codec plugin"
  "mingw-w64-mpg123: mpg123 mp3 audio decoder plugin"
  "mingw-w64-lame: LAME mp3 audio encoder plugin"
)

options=('!strip' '!buildflags' 'staticlibs')

source=(${url}/src/gst-plugins-good/gst-plugins-good-${pkgver}.tar.xz)
sha256sums=('5f8b553260cb0aac56890053d8511db1528d53cae10f0287cfce2cb2acc70979')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "${srcdir}/gst-plugins-good-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --with-package-name="GStreamer Good Plugins (Arch Linux)" \
      --with-package-origin="http://www.archlinux.org/" \
      --disable-examples --disable-oss4 --disable-oss --disable-dv1394 \
      --disable-aalib --disable-libcaca --disable-jack --disable-shout2

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
    cd ..
  done
}


package() {
  cd "${srcdir}/gst-plugins-good-${pkgver}"

  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="${pkgdir}" install

    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.a
    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.la
    rm -rf "$pkgdir"/usr/${_arch}/share/{aclocal,man,locale}

    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;

    cd ..
  done
}

# vim: ts=2 sw=2 et:
