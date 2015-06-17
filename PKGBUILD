
pkgname=ossim-svn
pkgver=21089
pkgrel=1

pkgdesc="OSSIM is a powerful suite of geospatial libraries and applications used to process imagery, maps, terrain, and vector data."
url="http://svn.osgeo.org/ossim/"
license=('LGPL')

arch=('i686' 'x86_64')

depends=('freetype2' 'gdal' 'libgeotiff' 'libjpeg' 'libtiff' 'openscenegraph28' 'openjpeg' 'gpstk-bin' 'doxygen')
makedepends=('gcc' 'make' 'cmake' 'minizip')
optdepends=('qt' 'openjdk6')

source=('ossim.sh')
provides=('ossim')
conflicts=('ossim')
install=ossim.install


_svntrunk="http://svn.osgeo.org/ossim/trunk/ossim"
_svnmod=ossim


build() {
#SVN
cd $srcdir

if [[ -d "$srcdir/ossim/.svn" ]]; then
  (cd "ossim" && svn up)
else
  svn co $_svntrunk $_svnmod
fi


if [[ -d "$srcdir/libwms/.svn" ]]; then
  (cd "libwms" && svn up)
else
  svn co  $url/trunk/libwms libwms
fi

if [[ -d "$srcdir/omar/.svn" ]]; then
  (cd "omar" && svn up)
else
  svn co  $url/omar omar
fi

if [[ -d "$srcdir/oms/.svn" ]]; then
  (cd "oms" && svn up)
else
  svn co  $url/trunk/oms oms
fi

if [[ -d "$srcdir/ossimGui/.svn" ]]; then
  (cd "ossimGui" && svn up)
else
  svn co  $url/trunk/ossimGui ossimGui
fi


if [[ -d "$srcdir/ossimPlanet/.svn" ]]; then
  (cd "ossimPlanet" && svn up)
else
  svn co  $url/trunk/ossimPlanet ossimPlanet
fi

if [[ -d "$srcdir/ossimPlanetQt/.svn" ]]; then
  (cd "ossimPlanetQt" && svn up)
else
  svn co  $url/trunk/ossimPlanetQt ossimPlanetQt
fi


if [[ -d "$srcdir/ossimPredator/.svn" ]]; then
  (cd "ossimPredator" && svn up)
else
  svn co  $url/trunk/ossimPredator ossimPredator
fi

if [[ -d "$srcdir/ossimjni/.svn" ]]; then
  (cd "ossimjni" && svn up)
else
  svn co  $url/trunk/ossimjni ossimjni
fi

if [[ -d "$srcdir/ossim_package_support/.svn" ]]; then
  (cd "ossim_package_support" && svn up)
else
  svn co  $url/trunk/ossim_package_support ossim_package_support
fi

if [[ -d "$srcdir/ossim_plugins/.svn" ]]; then
  (cd "ossim_plugins" && svn up)
else
  svn co  $url/trunk/ossim_plugins ossim_plugins
fi

if [[ -d "$srcdir/ossim_qt4/.svn" ]]; then
  (cd "ossim_qt4" && svn up)
else
  svn co  $url/trunk/ossim_qt4 ossim_qt4
fi

if [[ -d "$srcdir/ossimplanetCocoa/.svn" ]]; then
  (cd "ossimplanetCocoa" && svn up)
else
  svn co  $url/trunk/ossimplanetCocoa ossimplanetCocoa
fi


#Build
if [[ -d "$srcdir/work" ]]; then
  (rm -rf $srcdir/work)
fi

mkdir $srcdir/work/osgeo -p

cd $srcdir/work/osgeo
cp -r "$srcdir/omar" "omar"
cp -r "$srcdir/libwms" "libwms"
cp -r "$srcdir/oms" "oms"
cp -r "$srcdir/ossim" "ossim"
cp -r "$srcdir/ossimGui" "ossimGui"
cp -r "$srcdir/ossimPlanet" "ossimPlanet"
cp -r "$srcdir/ossimPlanetQt" "ossimPlanetQt"
cp -r "$srcdir/ossimPredator" "ossimPredator"
cp -r "$srcdir/ossim_package_support" "ossim_package_support"
cp -r "$srcdir/ossim_plugins" "ossim_plugins"
cp -r "$srcdir/ossim_qt4" "ossim_qt4"
cp -r "$srcdir/ossimjni" "ossimjni"
cp -r "$srcdir/ossimplanetCocoa" "ossimplanetCocoa"

#mkdir local
mkdir $srcdir/work/osgeo/build
cd $srcdir/work/osgeo/build

build_dir="$srcdir/work/osgeo";

cmake -G "Unix Makefiles" \
-DBUILD_CSMAPI=OFF \
-DBUILD_LIBRARY_DIR=lib \
-DBUILD_OMS=ON \
-DBUILD_OSSIM=ON \
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
-DBUILD_OSSIMMRSID_PLUGIN=ON \
-DBUILD_OSSIMNDF_PLUGIN=ON \
-DBUILD_OSSIMNUI_PLUGIN=OFF \
-DBUILD_OSSIMOPENJPEG_PLUGIN=ON \
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
-OSSIM_BUILD_DOXYGEN=ON \
-DCMAKE_BUILD_TYPE=Debug \
-DCMAKE_INCLUDE_PATH=${build_dir}/local/include \
-DCMAKE_INSTALL_PREFIX=/usr \
-DCMAKE_LIBRARY_PATH=${build_dir}/local/lib \
-DCMAKE_MODULE_PATH=${build_dir}/ossim_package_support/cmake/CMakeModules \
-DMRSID_DIR=${build_dir}/mrsid \
-DOSSIM_BUILD_ADDITIONAL_DIRECTORIES="${build_dir}/ossimjni" \
-DOSSIM_COMPILE_WITH_FULL_WARNING=ON \
-DOSSIM_DEPENDENCIES=${build_dir}/local \
-DOSSIM_DEV_HOME=${build_dir} \
-DOSSIM_INSTALL_PLUGINS_WITH_VERSION=OFF \
-DOSSIM_LIBRARIES=${build_dir}/build/lib/libossim.so \
-DOSSIM_PLUGIN_LINK_TYPE=MODULE \
-DOSSIMPLANET_ENABLE_EPHEMERIS=ON \
../ossim_package_support/cmake/

make -j 4 
make DESTDIR=${pkgdir} install || return 1

sed -i -e 's|epsg_database_file1: $(OSSIM_DATA)/ossim/share/ossim/ossim_epsg_projections-v7_4.csv|epsg_database_file1: $(OSSIM_DATA)/projection/ossim_epsg_projections-v7_4.csv|g' \
${srcdir}/work/osgeo/ossim/etc/templates/ossim_preferences_template
sed -i -e 's|epsg_database_file2: $(OSSIM_DATA)/ossim/share/ossim/ossim_harn_state_plane_epsg.csv|epsg_database_file2: $(OSSIM_DATA)/projection/ossim_harn_state_plane_epsg.csv|g' \
${srcdir}/work/osgeo/ossim/etc/templates/ossim_preferences_template
sed -i -e 's|epsg_database_file3: $(OSSIM_DATA)/ossim/share/ossim/ossim_state_plane_spcs.csv|epsg_database_file3: $(OSSIM_DATA)/projection/ossim_state_plane_spcs.csv|g' \
${srcdir}/work/osgeo/ossim/etc/templates/ossim_preferences_template
sed -i -e 's|epsg_database_file4: $(OSSIM_DATA)/ossim/share/ossim/ossim_harn_state_plane_esri.csv|epsg_database_file4: $(OSSIM_DATA)/projection/ossim_harn_state_plane_esri.csv|g' \
${srcdir}/work/osgeo/ossim/etc/templates/ossim_preferences_template

sed -i -e 's|wkt_database_file: $(OSSIM_DATA)/ossim/share/ossim/ossim_wkt_pcs.csv|wkt_database_file: $(OSSIM_DATA)/projection/ossim_wkt_pcs.csv|g' \
${srcdir}/work/osgeo/ossim/etc/templates/ossim_preferences_template

sed -i -e 's|geoid_ngs_directory: $(OSSIM_DATA)/ear1/geoid/geoid99|geoid_ngs_directory: $(OSSIM_DATA)/geoids/geoid99|g' \
${srcdir}/work/osgeo/ossim/etc/templates/ossim_preferences_template

sed -i -e 's|geoid_egm_96_grid: $(OSSIM_DATA)/ele1/geoid/geoid96/egm96.grd|geoid_egm_96_grid: $(OSSIM_DATA)/geoids/geoid1996/egm96.grd|g' \
${srcdir}/work/osgeo/ossim/etc/templates/ossim_preferences_template


# Install the templates file
cp -r ${srcdir}/work/osgeo/ossim/etc/templates ${pkgdir}/usr/share/ossim/

# Install the configuration file
mkdir ${pkgdir}/etc
install -D -m644 ${srcdir}/work/osgeo/ossim/etc/config_files/dbossim.cfg ${pkgdir}/etc/ossim/dbossim.cfg

# Install profile.d file
install -D ${srcdir}/ossim.sh \
	${pkgdir}/etc/profile.d/ossim.sh

}
md5sums=('cb85c216a099b10f057cddeeae4a57fb')
