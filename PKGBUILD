# $Id$
# Maintainer: Sven Fischer <aur.archlinux@linux4tw.de>

pkgname=guayadeque-git
_pkgname=guayadeque
pkgver=0.4.5.r2050.9fec4f7b
pkgrel=1
pkgdesc='Lightweight music player'
arch=('i686' 'x86_64')
url='http://guayadeque.org/'
license=('GPL3')
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
depends=('curl' 'libgpod' 'taglib' 'wxsqlite3' 'gst-plugins-base')
makedepends=('cmake' 'git')
optdepends=('gst-plugins-good: Support for PulseAudio and additional file formats'
            'gst-plugins-bad: Support for additional file formats'
            'gst-plugins-ugly: Support for additional file formats'
            'gst-libav: Support for additional file formats'
            'gvfs: Support for external devices')
source=('git+https://github.com/anonbeat/guayadeque.git')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local srcversion="$(grep "ID_GUAYADEQUE_VERSION" src/Version.h.in | cut -d '"' -f 2)"
  printf "%s.r%s.%s" $srcversion "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./buildt
  cmake . \
    -DCMAKE_CXX_STANDARD='11' \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
