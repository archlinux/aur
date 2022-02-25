# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gstreamer-git
pkgver=1.16.0.r15.ab60a330d
pkgrel=1
_gitname=gstreamer
pkgdesc="GStreamer Multimedia Framework (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
makedepends=('mingw-w64-meson' 'git')
depends=('mingw-w64-glib2' 'mingw-w64-libxml2')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-gstreamer')
provides=('mingw-w64-gstreamer')

source=("${_gitname}::git+https://gitlab.freedesktop.org/gstreamer/${_gitname}/")
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
      -D examples=disabled \
      -D doc=disabled \
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
