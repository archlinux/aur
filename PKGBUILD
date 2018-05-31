# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-plugins-bad-git
pkgver=1.14.0.r190.3f2314a1a
pkgrel=1
_gitname=gst-plugins-bad
pkgdesc="GStreamer Multimedia Framework Bad Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gstreamer-git' 'mingw-w64-orc')
makedepends=('git' 'mingw-w64-meson' 'mingw-w64-openh264' 'mingw-w64-nettle' 'mingw-w64-opus' 'mingw-w64-bzip2' 'mingw-w64-libsrtp' 'mingw-w64-vo-aacenc' 'mingw-w64-libkate' 'mingw-w64-librsvg' 'mingw-w64-openjpeg2' 'mingw-w64-opencv' 'mingw-w64-libfdk-aac' 'mingw-w64-librtmp0')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-gst-plugins-bad')

source=("${_gitname}::git://anongit.freedesktop.org/gstreamer/${_gitname}")
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
