# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>
# Contributor: mbostwick <mbostwick89@gmail.com>
# Contributor: Christian Wygoda <accounts@wygoda.net>

pkgname=ossim
_pkgname=ossim
pkgver=2.12.0
pkgrel=2
pkgdesc="OSSIM is a powerful suite of geospatial libraries and applications used to process imagery, maps, terrain, and vector data."
url="http://www.ossim.org"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('freetype2' 'gdal' 'libgeotiff' 'libjpeg' 'libtiff' 'openthreads' 'openjpeg2'  'doxygen' 
'hdf5-cpp-fortran' 'minizip' 'expat' 'ffmpeg' 'qt5-base' 'podofo' 'bzip2' 'freetype2' 'pdal')
makedepends=('cmake')
optdepends=( 'java-environment-common' 'openmpi' 'gpstk-bin' )
source=(https://github.com/ossimlabs/ossim/archive/${pkgver}.tar.gz
        ossim.sh )
install=ossim.install
md5sums=('6b5930d3eca47555f4031480f8dc8847'
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
  -DCMAKE_BUILD_TYPE=Release \
  -DFREETYPE_INCLUDE_DIR_ft2build=/usr/include/freetype2 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DINSTALL_LIBRARY_DIR:PATH=/usr/lib \
  -DINSTALL_ARCHIVE_DIR:PATH=/usr/lib \
  -DBUILD_GDAL_PLUGIN=ON \
  -DBUILD_MRSID_PLUGIN=OFF \
  -DBUILD_OMS=ON \
  -DBUILD_OSSIM_APPS=ON \
  -DBUILD_OSSIM_CURL_APPS=OFF \
  -DBUILD_OSSIM_FREETYPE_SUPPORT=ON \
  -DBUILD_OSSIM_GUI=ON \
  -DBUILD_OSSIM_PLANET=ON \
  -DBUILD_OSSIM_VIDEO=ON \
  -DBUILD_OSSIM_HDF5_SUPPORT=OFF \
  -DBUILD_KAKADU_PLUGIN=OFF \
  -DBUILD_OSSIM_ID_SUPPORT=ON \
  -DBUILD_OSSIM_MPI_SUPPORT=OFF \
  -DBUILD_OSSIM_WMS=ON \
  -DBUILD_SHARED_LIBS=ON \
  -DBUILD_PDAL_PLUGIN=ON \
  $buildir \

  make -j$(nproc)
}


package() {

  cd $srcdir/build
  buildir="$srcdir/${pkgname}-${pkgver}";
  make DESTDIR=${pkgdir} install || return 1  

  sed -i -e 's|epsg_database_file1: $(OSSIM_DATA)/ossim/share/ossim/projection/ossim_epsg_projections-v7_4.csv|epsg_database_file1: $(OSSIM_DATA)/projection/ossim_epsg_projections-v7_4.csv|g' \
  ${buildir}/share/ossim/templates/ossim_preferences_template

  sed -i -e 's|epsg_database_file2: $(OSSIM_DATA)/ossim/share/ossim/projection/ossim_harn_state_plane_epsg.csv|epsg_database_file2: $(OSSIM_DATA)/projection/ossim_harn_state_plane_epsg.csv|g' \
  ${buildir}/share/ossim/templates/ossim_preferences_template
  
  sed -i -e 's|epsg_database_file3: $(OSSIM_DATA)/ossim/share/ossim/projection/ossim_state_plane_spcs.csv|epsg_database_file3: $(OSSIM_DATA)/projection/ossim_state_plane_spcs.csv|g' \
  ${buildir}/share/ossim/templates/ossim_preferences_template

  sed -i -e 's|epsg_database_file4: $(OSSIM_DATA)/ossim/share/ossim/projection/ossim_harn_state_plane_esri.csv|epsg_database_file4: $(OSSIM_DATA)/projection/ossim_harn_state_plane_esri.csv|g' \
  ${buildir}/share/ossim/templates/ossim_preferences_template

  sed -i -e 's|wkt_database_file: $(OSSIM_DATA)/ossim/share/ossim/projection/ossim_wkt_pcs.csv|wkt_database_file: $(OSSIM_DATA)/projection/ossim_wkt_pcs.csv|g' \
  ${buildir}/share/ossim/templates/ossim_preferences_template

  sed -i -e 's|geoid_ngs_directory: $(OSSIM_DATA)/ear1/geoid/geoid99|geoid_ngs_directory: $(OSSIM_DATA)/geoids/geoid99|g' \
  ${buildir}/share/ossim/templates/ossim_preferences_template

  sed -i -e 's|geoid_egm_96_grid: $(OSSIM_DATA)/ele1/geoid/geoid96/egm96.grd|geoid_egm_96_grid: $(OSSIM_DATA)/geoids/geoid1996/egm96.grd|g' \
  ${buildir}/share/ossim/templates/ossim_preferences_template

  # Install the templates file
  cp -r ${buildir}/share/ossim/templates ${pkgdir}/usr/share/ossim/

  # Install the configuration file
  mkdir ${pkgdir}/etc
  #install -D -m644 ${buildir}/ossim/etc/config_files/dbossim.cfg ${pkgdir}/etc/ossim/dbossim.cfg

  # Install profile.d file
  install -D ${srcdir}/ossim.sh \
  ${pkgdir}/etc/profile.d/ossim.sh

}

