# Maintainer: Samuel Mesa <samuelmesa dot gmail.com>
# Initial Maintainer: strigyskow
# Contributor: snork

pkgname=spatialite-gui-devel
_pkgname=spatialite-gui
pkgver=r230.0942f54
pkgrel=1
pkgdesc="spatialite-gui is an open source Graphical User Interface (GUI) 
tool supporting SpatiaLite. Development version"
url="https://www.gaia-gis.it/fossil/spatialite_gui/index"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('libspatialite-devel' 'librasterlite2-devel' 'virtualpg-devel' 'wxgtk' 'openjpeg2' 'libiconv')
conflicts=('spatialite-gui')
provides=('spatialite-gui')
replaces=('spatialite-gui')

prepare() {
  mkdir -p $_pkgname
  cd $_pkgname

  fossil clone https://www.gaia-gis.it/fossil/spatialite_gui spatialite_gui.fossil
  fossil open spatialite_gui.fossil
}

pkgver() {
  cd $_pkgname

  _hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
  _revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
  printf "r%s.%s" "$_revision" "$_hash"
}

build() {
  cd ${_pkgname}

  ./configure --prefix="/usr" \
  CXXFLAGS="`wx-config --version=3.0 --cxxflags`" \
  LIBS="`wx-config --version=3.0 --libs`"

  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
  install -D -m644 gnome_resource/spatialite-gui.desktop "${pkgdir}"/usr/share/applications/spatialite-gui.desktop
  install -D -m644 gnome_resource/spatialite-gui.png "${pkgdir}"/usr/share/pixmaps/spatialite-gui.png
}
