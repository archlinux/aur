# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=ossim
pkgver=1.8.18
pkgrel=1
pkgdesc="OSSIM is a powerful suite of geospatial libraries and applications used to process imagery, maps, terrain, and vector data."
url="http://www.ossim.org"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('freetype2' 'gdal' 'libgeotiff' 'libjpeg' 'libtiff' 'openscenegraph' 'openjpeg'  'doxygen' 'hdf5-cpp-fortran' 
        'minizip' 'expat' 'ffmpeg')
makedepends=('gcc' 'make' 'cmake')
optdepends=('qt4' 'java-environment-common' 'openmpi' 'gpstk-bin' )
source=(http://download.osgeo.org/ossim/source/latest/${pkgname}-${pkgver}.tar.gz ossim.sh)
provides=('ossim')
conflicts=('ossim')
install=ossim.install
md5sums=('7bb918d8e20715d794eef86ad26e1389'
         'cb85c216a099b10f057cddeeae4a57fb')

build() {
  cd $srcdir

  #Build
  if [[ -d "$srcdir/build" ]]; then
    (rm -rf $srcdir/build)
  fi

  mkdir $srcdir/build
  cd $srcdir/build

  OSSIM_DEV_HOME="$srcdir/${pkgname}-${pkgver}";
  buildir="$srcdir/${pkgname}-${pkgver}";

  cmake -G "Unix Makefiles" \
  -DBUILD_CSMAPI=OFF \
  -DBUILD_OMS=ON \
  -DBUILD_OSSIM=ON \
  -DBUILD_OSSIM_PACKAGES=ON \
  -DBUILD_OSSIM_PLUGIN=ON  \
  -DBUILD_OSSIMCONTRIB_PLUGIN=OFF \
  -DBUILD_OSSIMCSM_PLUGIN=OFF \
  -DBUILD_OSSIMGEOPDF_PLUGIN=ON \
  -DBUILD_OSSIMGDAL_PLUGIN=ON \
  -DBUILD_OSSIMHDF_PLUGIN=OFF \
  -DBUILD_OSSIMKAKADU_PLUGIN=OFF \
  -DBUILD_OSSIMKMLSUPEROVERLAY_PLUGIN=ON \
  -DBUILD_OSSIMLAS_PLUGIN=ON \
  -DBUILD_OSSIMLIBLAS_PLUGIN=OFF \
  -DBUILD_OSSIMLIBRAW_PLUGIN=ON \
  -DBUILD_OSSIMMRSID_PLUGIN=OFF \
  -DBUILD_OSSIMNDF_PLUGIN=ON \
  -DBUILD_OSSIMOPENJPEG_PLUGIN=OFF \
  -DBUILD_OSSIMHDF5_PLUGIN=ON \
  -DBUILD_OSSIMWORLDWIND_PLUGIN=ON \
  -DBUILD_OSSIMLIBLAS_PLUGIN=ON \
  -DBUILD_OSSIMOPENCV_PLUGIN=ON \
  -DBUILD_OSSIMSQLITE_PLUGIN=ON \
  -DBUILD_OSSIMWEB_PLUGIN=ON \
  -DBUILD_OSSIMPNG_PLUGIN=ON \
  -DBUILD_OSSIMREGISTRATION_PLUGIN=ON \
  -DBUILD_OSSIMQT4=ON \
  -DBUILD_OSSIMGUI=ON \
  -DBUILD_OSSIM_MPI_SUPPORT=OFF \
  -DBUILD_OSSIMPLANET=ON \
  -DBUILD_OSSIMPLANETQT=ON \
  -DBUILD_OSSIMPREDATOR=ON \
  -DBUILD_OSSIM_TEST_APPS=ON \
  -DBUILD_RUNTIME_DIR=bin \
  -DBUILD_SHARED_LIBS=ON \
  -DBUILD_WMS=ON \
  -DWMS_INCLUDE_DIR=${buildir}/libwms/include \
  -OSSIM_BUILD_DOXYGEN=ON \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_LIBDIR=/usr/lib \
  -DBUILD_LIBRARY_DIR=/usr/lib \
  -DOSSIM_DEV_HOME=${buildir} \
  -DCMAKE_MODULE_PATH=${buildir}/ossim_package_support/cmake/CMakeModules \
  -DOSSIM_BUILD_ADDITIONAL_DIRECTORIES="${buildir}/ossimjni" \
  -DOSSIM_COMPILE_WITH_FULL_WARNING=ON \
  -DOSSIM_INSTALL_PLUGINS_WITH_VERSION=OFF \
  -DOSSIM_LIBRARIES=${buildir}/build/lib/libossim.so \
  -DOSSIM_PLUGIN_LINK_TYPE=MODULE \
  -DOSSIMPLANET_ENABLE_EPHEMERIS=ON \
  ${buildir}/ossim_package_support/cmake

  #-DOSSIM_DEPENDENCIES=${buildir}/local \
  #-DCMAKE_INCLUDE_PATH=${buildir}/local/include \
  #-DCMAKE_LIBRARY_PATH=${buildir}/local/lib \
  #-DMRSID_DIR=${buildir}/mrsid \

  make -j5
}


package() {

  cd $srcdir/build
  buildir="$srcdir/${pkgname}-${pkgver}";
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
  install -D -m644 ${buildir}/ossim/etc/config_files/dbossim.cfg ${pkgdir}/etc/ossim/dbossim.cfg

  # Install profile.d file
  install -D ${srcdir}/ossim.sh \
  	${pkgdir}/etc/profile.d/ossim.sh

}

