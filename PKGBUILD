# $Id$
# Maintainer: Scott Furry <scott.wl.furry@gmail.com>

pkgname=musicqueue
_incr="7"
pkgver="0.4.${_incr}"
pkgrel="2"
pkgdesc='Lightweight music player'
arch=('i686' 'x86_64')
url='http://musicqueue.furcat.ca/'
license=('GPL3')
replaces=('musicqueue-git')
depends=('openssl' 'wxsqlite3' 'curl' 'desktop-file-utils' 'libgpod' 'taglib' 'wxgtk' 'gdk-pixbuf2')
makedepends=('cmake')
optdepends=('gstreamer0.10-good-plugins: Support for additional file formats'
            'gstreamer0.10-bad-plugins: Support for additional file formats'
            'gstreamer0.10-ugly-plugins: Support for additional file formats'
            'gvfs: Support for external devices')
source=("${pkgname}-${pkgver}.tar.gz::\
https://gitlab.com/digifuzzy/${pkgname}/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('99913c388eedda4e82a61002bb1ee7d34dce47784110acc30d5985cff173e0ec')
BUILDFLDR='localbuild'

prepare() {
  # extracted folder has HEAD hash appended to folder name
  mv "${pkgname}-v${pkgver}-"* "${pkgname}-${pkgver}"
  # remove previous local build folder
  if [ -d ${pkgname}-${pkgver}/${BUILDFLDR} ]
  then
    rm -fR ${pkgname}-${pkgver}/${BUILDFLDR}
  fi
}

build() {
  cd ${pkgname}-${pkgver}
  mkdir ${BUILDFLDR}
  cd ${BUILDFLDR}

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release'                            \
    -DCMAKE_INSTALL_PREFIX="${prefix}"                      \
    -DwxWidgets_wxrc_EXECUTABLE="${prefix}/bin/wxrc"        \
    -DwxWidgets_CONFIG_EXECUTABLE="${prefix}/bin/wx-config" \
    -DCMAKE_CXX_STANDARD='11'                               \
    -DCMAKE_SKIP_RPATH=FALSE                                \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=FALSE                  \
    -D_GUREVISION_:STRING="${_incr}"
  make
}

package() {
  cd ${pkgname}-${pkgver}/${BUILDFLDR}
  make DESTDIR="${pkgdir}" install
}
