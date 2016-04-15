# $Id$
# Maintainer: Scott Furry <scott.wl.furry@gmail.com>

PKGNAMESHORT=musicqueue
pkgname=${PKGNAMESHORT}-git
pkgver=0.4.3
pkgrel=3
pkgdesc='Lightweight music player'
arch=('i686' 'x86_64')
url='http://musicqueue.furcat.ca/'
license=('GPL3')
depends=('curl' 'desktop-file-utils' 'libgpod' 'taglib' 'wxgtk' 'gdk-pixbuf2')
makedepends=('cmake')
optdepends=('gstreamer0.10-good-plugins: Support for additional file formats'
            'gstreamer0.10-bad-plugins: Support for additional file formats'
            'gstreamer0.10-ugly-plugins: Support for additional file formats'
            'gvfs: Support for external devices')
source=("${PKGNAMESHORT}::git+https://gitlab.com/digifuzzy/${PKGNAMESHORT}.git#tag=v${pkgver}")
sha256sums=('SKIP')
BUILDFLDR='localbuild'

prepare() {
  cd ${PKGNAMESHORT}
}

build() {
  cd ${PKGNAMESHORT}
  git clean -dfx
  git reset --hard HEAD
  mkdir ${BUILDFLDR}
  cd ${BUILDFLDR}

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc' \
    -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config' \
    -DCMAKE_CXX_STANDARD='11' \
    -DCMAKE_CXX_FLAGS='-Wno-deprecated-declarations' \
    -D_GUREVISION_:STRING="${pkgrel}"
  make
}

package() {
  cd ${PKGNAMESHORT}/${BUILDFLDR}
  make DESTDIR="${pkgdir}" install
}

post_install() {
  update-desktop-database -q
}

post_upgrade(){
  post_install
}

post_remove(){
  post_install
}
