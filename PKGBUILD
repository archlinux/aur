# $Id$
# Maintainer: Sven Fischer <aur.archlinux@linux4tw.de>

pkgname=guayadeque-git
_pkgname=guayadeque
pkgver=0.4.1.r1913.eb446b3
pkgrel=1
pkgdesc='Lightweight music player'
arch=('i686' 'x86_64')
url='http://guayadeque.org/'
license=('GPL3')
depends=('curl' 'desktop-file-utils' 'libgpod' 'taglib' 'wxgtk' 'gdk-pixbuf2' 'wxsqlite3')
makedepends=('cmake')
optdepends=('gstreamer0.10-good-plugins: Support for additional file formats'
			'gstreamer0.10-bad-plugins: Support for additional file formats'
			'gstreamer0.10-ugly-plugins: Support for additional file formats'
			'gvfs: Support for external devices')
source=('git+https://github.com/anonbeat/guayadeque.git'
        '0001-use-cmake-lib-search-procedure-for-wxsqlite3-from-mu.patch')
sha512sums=('SKIP'
'059499cf1e9a3d4dc825733aaea1920a8150b46c88c33966b29924865f7fd01ec58651a506620ff937175c77e29bfdade07ea9effe08e93d11c7cc3990f515bc')

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i ../0001-use-cmake-lib-search-procedure-for-wxsqlite3-from-mu.patch
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local srcversion="$(grep "ID_GUAYADEQUE_VERSION" src/Version.h.in | cut -d '"' -f 2)"
  printf "%s.r%s.%s" $srcversion "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./buildt
  cmake . \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX=${pkgdir} \
    -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc' \
    -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config' \
    -DwxWidgets_INCLUDE_DIRS='/usr/include/wx/'
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
