# $Id$
# Maintainer: Sven Fischer <aur.archlinux@linux4tw.de>

pkgname=guayadeque-git
_pkgname=guayadeque
pkgver=0.4.1.r1903.4487b9a
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
#install='guayadeque.install'
source=('git+https://github.com/anonbeat/guayadeque.git'
        '0001-add-gdk_pixbuf2-lib.patch')
sha512sums=('SKIP'
            '6b634fb99f733c3f35aec8d0827e09d8a51228fe988f3b00d060fc86be2c2415f5e9e34016829e53405eeb5bd42c5e2ff5fd43d77d1bd102fdc0ef5270b3f7c7')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local srcversion="$(grep "ID_GUAYADEQUE_VERSION" src/Version.h.in | cut -d '"' -f 2)"
  printf "%s.r%s.%s" $srcversion "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i ../../0001-add-gdk_pixbuf2-lib.patch
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
