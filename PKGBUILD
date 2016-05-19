# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>
# Contributor: mbostwick <mbostwick89@gmail.com>
# Contributor: Christian Wygoda <accounts@wygoda.net>

pkgname=ossim
pkgver=1.8.20.3
_pkgver=1.8.20-3
pkgrel=1
pkgdesc="OSSIM is a powerful suite of geospatial libraries and applications used to process imagery, maps, terrain, and vector data."
url="http://www.ossim.org"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('freetype2' 'gdal' 'libgeotiff' 'libjpeg' 'libtiff' 'openscenegraph' 'openjpeg'  'doxygen' 'hdf5-cpp-fortran' 
        'minizip' 'expat' 'ffmpeg' 'qt4' 'podofo' 'liblas' 'bzip2' 'freetype2')
makedepends=('cmake')
optdepends=( 'java-environment-common' 'openmpi' 'gpstk-bin' )
source=(http://download.osgeo.org/ossim/source/latest/${pkgname}-${_pkgver}.tar.gz
        ossim.sh 
        lib64bit_cmake_patch.patch
        fix-ossim-trac-2354.diff)
install=ossim.install
md5sums=('eb2265db0d4d9201e255b92317121cfd'
         'cb85c216a099b10f057cddeeae4a57fb'
         '9531d170d973b85bcf8f0889d9415d99'
         '79e1e01bc9b8de9e0c0f481ccb19a8f7')

prepare() {
  cd ${srcdir}/${pkgname}-${_pkgver}
  patch -p0 < ../lib64bit_cmake_patch.patch
  patch -p0 < ../fix-ossim-trac-2354.diff
}

build() {
  cd $srcdir

  #Build
  if [[ -d "$srcdir/build" ]]; then
    (rm -rf $srcdir/build)
  fi

  mkdir $srcdir/build
  cd $srcdir/build

  OSSIM_DEV_HOME="$srcdir/${pkgname}-${_pkgver}";
  buildir="$srcdir/${pkgname}-${_pkgver}";

  cmake -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_OSSIM_MPI_SUPPORT=OFF  \
  -DBUILD_OSSIM_TEST_APPS=OFF    \
  -DSubversion_SVN_EXECUTABLE=""  \
  -DCMAKE_MODULE_PATH=${buildir}/ossim_package_support/cmake/CMakeModules    \
  -DFREETYPE_INCLUDE_DIR_ft2build=/usr/include/freetype2    \
  -DBUILD_WMS=OFF  \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DINSTALL_LIBRARY_DIR:PATH=/usr/lib \
  -DINSTALL_RUNTIME_DIR:PATH=/usr/bin/ossim-apps/ \
  -DINSTALL_ARCHIVE_DIR:PATH=/usr/lib \
  ${buildir}/ossim \

  make -j4
}


package() {

  cd $srcdir/build
  buildir="$srcdir/${pkgname}-${_pkgver}";
  make DESTDIR=${pkgdir} install || return 1  

  sed -i -e 's|epsg_database_file1: $(OSSIM_DATA)/ossim/share/ossim/projection/ossim_epsg_projections-v7_4.csv|epsg_database_file1: $(OSSIM_DATA)/projection/ossim_epsg_projections-v7_4.csv|g' \
  ${buildir}/ossim/etc/templates/ossim_preferences_template
  sed -i -e 's|epsg_database_file2: $(OSSIM_DATA)/ossim/share/ossim/projection/ossim_harn_state_plane_epsg.csv|epsg_database_file2: $(OSSIM_DATA)/projection/ossim_harn_state_plane_epsg.csv|g' \
  ${buildir}/ossim/etc/templates/ossim_preferences_template
  sed -i -e 's|epsg_database_file3: $(OSSIM_DATA)/ossim/share/ossim/projection/ossim_state_plane_spcs.csv|epsg_database_file3: $(OSSIM_DATA)/projection/ossim_state_plane_spcs.csv|g' \
  ${buildir}/ossim/etc/templates/ossim_preferences_template
  sed -i -e 's|epsg_database_file4: $(OSSIM_DATA)/ossim/share/ossim/projection/ossim_harn_state_plane_esri.csv|epsg_database_file4: $(OSSIM_DATA)/projection/ossim_harn_state_plane_esri.csv|g' \
  ${buildir}/ossim/etc/templates/ossim_preferences_template

  sed -i -e 's|wkt_database_file: $(OSSIM_DATA)/ossim/share/ossim/projection/ossim_wkt_pcs.csv|wkt_database_file: $(OSSIM_DATA)/projection/ossim_wkt_pcs.csv|g' \
  ${buildir}/ossim/etc/templates/ossim_preferences_template

  sed -i -e 's|geoid_ngs_directory: $(OSSIM_DATA)/ear1/geoid/geoid99|geoid_ngs_directory: $(OSSIM_DATA)/geoids/geoid99|g' \
  ${buildir}/ossim/etc/templates/ossim_preferences_template

  sed -i -e 's|geoid_egm_96_grid: $(OSSIM_DATA)/ele1/geoid/geoid96/egm96.grd|geoid_egm_96_grid: $(OSSIM_DATA)/geoids/geoid1996/egm96.grd|g' \
  ${buildir}/ossim/etc/templates/ossim_preferences_template


  # Install the templates file
  cp -r ${buildir}/ossim/etc/templates ${pkgdir}/usr/share/ossim/

  # Install the configuration file
  mkdir ${pkgdir}/etc
  #install -D -m644 ${buildir}/ossim/etc/config_files/dbossim.cfg ${pkgdir}/etc/ossim/dbossim.cfg

  # Install profile.d file
  install -D ${srcdir}/ossim.sh \
  	${pkgdir}/etc/profile.d/ossim.sh

}

