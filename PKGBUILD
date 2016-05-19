# $Id$
# Maintainer: Sven Fischer <aur.archlinux@linux4tw.de>

pkgname=guayadeque-git
_pkgname=guayadeque
pkgver=0.4.1.r1905.68a2d26
pkgrel=1
pkgdesc='Lightweight music player'
arch=('i686' 'x86_64')
url='http://guayadeque.org/'
license=('GPL3')
depends=('curl' 'desktop-file-utils' 'libgpod' 'taglib' 'wxgtk2.8' 'gdk-pixbuf2')
makedepends=('cmake')
optdepends=('gstreamer0.10-good-plugins: Support for additional file formats'
			'gstreamer0.10-bad-plugins: Support for additional file formats'
			'gstreamer0.10-ugly-plugins: Support for additional file formats'
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
    -DCMAKE_INSTALL_PREFIX=${pkgdir} \
    -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-2.8' \
    -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-2.8' \
    -DwxWidgets_INCLUDE_DIRS='/usr/include/wx-2.8/'
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
