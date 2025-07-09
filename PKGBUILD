# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-plugins-base
pkgver=1.24.5
pkgrel=2
pkgdesc="GStreamer Multimedia Framework Base Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gstreamer' 'mingw-w64-orc' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libpng')
makedepends=('glib2-devel' 'mingw-w64-meson' 'mingw-w64-opus' 'mingw-w64-libvorbis' 'mingw-w64-pango' 'mingw-w64-libtheora' 'mingw-w64-libvisual')
optdepends=(
  "mingw-w64-libvisual: libvisual audio visualization plugin"
  "mingw-w64-opus: OPUS audio codec plugin"
  "mingw-w64-libvorbis: Vorbis audio parser, tagger, and codec plugin"
  "mingw-w64-libtheora: Theora video parser and codec plugin"
  "mingw-w64-pango: Pango text rendering and overlay plugin"
)
options=('!strip' '!buildflags' 'staticlibs')

source=("${url}src/gst-plugins-base/gst-plugins-base-${pkgver}.tar.xz" "0001-audio-util-parameters.patch")
sha256sums=('0e33ec9b59eef5ef3a6a53bbd55c44340e681d0000910caca12541a73db38a7d'
            '76a881c429c5ec43504afc0978f0266faa71f7953a35c976c72f7e7273b3d0d7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "gst-plugins-base-"$pkgver
    patch -Np1 -i ../../0001-audio-util-parameters.patch
}

build() {
  cd "${srcdir}/gst-plugins-base-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}" && pushd build-${_arch}
    ${_arch}-meson \
      -D strip=true \
      -D examples=disabled \
      -D doc=disabled \
      -D package-name="GStreamer (Arch Linux)" \
      -D package-origin="http://www.archlinux.org/" ..
    ninja
    popd
  done
}

package() {
  cd "${srcdir}/gst-plugins-base-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/gst-plugins-base-${pkgver}/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
