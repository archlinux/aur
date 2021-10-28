# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-editing-services-git
pkgver=1.16.0.r2.63ee4262
pkgrel=1
_gitname=gst-editing-services
pkgdesc="GStreamer editing services (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gst-plugins-base-git')
makedepends=('mingw-w64-meson')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-gst-editing-services')

source=("${_gitname}::git+https://gitlab.freedesktop.org/gstreamer/${_gitname}/")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "%s" "$(git describe --always --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_gitname}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}" && pushd build-${_arch}
    ${_arch}-meson \
      -D doc=disabled ..
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
