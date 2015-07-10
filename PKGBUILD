# Maintainer: Braden Pellett (daBrado) <aurcontact@dabrado.net>
# Contributor: oldbay <old_bay@mail.ru>

pkgname=ossim-nogui-svn
pkgver=22270
pkgrel=2
pkgdesc='A powerful suite of geospatial libraries and applications used to process imagery, maps, terrain, and vector data; built w/o GUIs'
url=http://www.ossim.org/
license=(LGPL)
install=$pkgname.install
source=(
  svn+http://svn.osgeo.org/ossim/trunk/ossim
  svn+http://svn.osgeo.org/ossim/trunk/ossim_plugins
  svn+http://svn.osgeo.org/ossim/trunk/csmApi
  svn+http://svn.osgeo.org/ossim/trunk/libwms
  svn+http://svn.osgeo.org/ossim/trunk/oms
  svn+http://svn.osgeo.org/ossim/trunk/ossimPredator
  svn+http://svn.osgeo.org/ossim/trunk/ossim_package_support/cmake
  svn+http://svn.osgeo.org/ossim/trunk/ossim_package_support/fonts
  svn+http://svn.osgeo.org/ossim/trunk/ossim_package_support/geoids
)
md5sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP)
arch=(i686 x86_64)
backup=(etc/ossim_preferences)
depends=(openthreads ffmpeg gdal)
makedepends=(cmake)
conflicts=(ossim)
provides=(ossim)

pkgver() {
  cd "$srcdir"/ossim
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir"
  ln -snf . ossim_package_support
  cmake -G "Unix Makefiles" \
    -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DOSSIM_DEV_HOME="$srcdir" \
    -DCSMAPI_INCLUDE_DIRS="$srcdir"/csmApi/include \
    -DBUILD_RUNTIME_DIR=bin \
    -DBUILD_LIBRARY_DIR=lib \
    -DOSSIM_COMPILE_WITH_FULL_WARNING=ON \
    -DBUILD_OSSIM=ON \
    -DBUILD_OSSIMCONTRIB_PLUGIN=ON \
    -DBUILD_OSSIMGDAL_PLUGIN=ON \
    -DBUILD_OSSIMPNG_PLUGIN=ON \
    -DBUILD_OSSIM_MPI_SUPPORT=OFF \
    -DBUILD_OSSIMPLANET=OFF \
    -DBUILD_OSSIMPLANETQT=OFF \
    -DBUILD_OSSIMQT4=OFF \
    -DBUILD_OSSIMGUI=OFF \
    cmake
  make
  echo 'export OSSIM_DATA=/usr/share' >ossim.sh
  echo 'export OSSIM_PREFS_FILE=/etc/ossim_preferences' >>ossim.sh
  sed \
    -e 's,$(OSSIM_DATA)/ossim/share/ossim/ossim_wkt_pcs.csv,/usr/share/ossim/projection/ossim_wkt_pcs.csv,' \
    -e 's,$(OSSIM_DATA)/ele1/geoid/geoid96/egm96.grd,/usr/share/ossim/geoids/geoid1996/egm96.grd,' \
    -e 's,$(OSSIM_DATA)/ossim/share/ossim/,/usr/share/ossim/,g' \
    ossim/etc/templates/ossim_preferences_template >ossim_preferences
  echo $'\n''plugin.dir1: /usr/lib/ossim/plugins' >>ossim_preferences
}

package() {
  cd "$srcdir"
  make DESTDIR="${pkgdir}" install
  install -D -m755 ossim.sh ${pkgdir}/etc/profile.d/ossim.sh
  install -D -m644 ossim_preferences ${pkgdir}/etc/ossim_preferences
}
