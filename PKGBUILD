# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-plugins-good-git
pkgver=1.14.0.r110.0fbde2a07
pkgrel=1
_gitname=gst-plugins-good
pkgdesc="GStreamer Multimedia Framework Good Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gstreamer-git' 'mingw-w64-orc')
makedepends=('git' 'mingw-w64-meson' 'mingw-w64-libsoup' 'mingw-w64-cairo' 'mingw-w64-gdk-pixbuf2' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libpng' 'mingw-w64-libvpx' 'mingw-w64-bzip2' 'mingw-w64-speex' 'mingw-w64-flac' 'mingw-w64-wavpack' 'mingw-w64-mpg123' 'mingw-w64-lame')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-gst-plugins-good')

source=("$_gitname::git://anongit.freedesktop.org/gstreamer/$_gitname")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_gitname}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}" && pushd build-${_arch}
    ${_arch}-meson \
      -D package-name="GStreamer (Arch Linux)" \
      -D package-origin="http://www.archlinux.org/" ..
    ninja
    popd
  done
}

package() {
  cd "${srcdir}/${_gitname}"

  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/${_gitname}/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
