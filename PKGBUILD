# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-plugins-ugly-git
pkgver=1.16.0.r3.e778c559
pkgrel=1
_gitname=gst-plugins-ugly
pkgdesc="GStreamer Multimedia Framework Ugly Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gst-plugins-base-git')
makedepends=('git' 'mingw-w64-meson' 'mingw-w64-x264' 'mingw-w64-opencore-amr')
optdepends=(
  "mingw-w64-x264: H.264 video encoder plugin"
  "mingw-w64-opencore-amr: Adaptive Multi-Rate Narrow-Band audio codec plugin"
)
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-gst-plugins-ugly')

source=("${_gitname}::git+https://gitlab.freedesktop.org/gstreamer/${_gitname}/")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
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
