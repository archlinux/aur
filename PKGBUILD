# Maintainer: dobedobedo <dobe0331 at gmail dot com>
# Contributor: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: 	diestl <max at friedersdorff dot com>
_pkgname='rsgislib'
pkgname=("python-$_pkgname")
pkgver=5.0.14
pkgrel=1
pkgdesc="Python modules for processing remote sensing and GIS datasets"
arch=('i686' 'x86_64')
url='http://www.rsgislib.org'
license=('GPL3')
makedepends=('cmake' 'boost')
depends=('hdf5' 'kealib' 'muparser' 'gsl' 'gdal' 'boost-libs' 'python-gdal'
         'python-numpy' 'python-scikit-learn' 'python-tqdm' 'python-rios')
optdepends=(
  'plotly-orca-appimage: For classification.plot_train_data'
  'python-alphashape: For vectorgeoms.create_alpha_shape'
  'python-catboost: For classification.classcatboost'
  'python-contextily: For tools.mapping.add_contextily_basemap'
  'python-geopandas: Handle GeoJSON in vectorattrs, vectorutils, '`
    `'vectorgeoms, tools.mapping, classification.create_acc_pt_sets and '`
    `'imageregistration.add_vec_pts_as_gcps_to_img'
  'python-google-cloud-storage: Enable tools.googlecloud'
  'python-h3: For vectorutils.createvectors.create_hex_grid_*'
  'python-h5py: HDF5 files in classification, rastergis, zonalstats and '`
    `'tools.checkdatasets'
  'python-imageio: For tools.imagetools.animate_img_set'
  'python-imbalanced-learn: For classification.classimblearn'
  'python-jinja: Required by rsgisapplycmd.py CLI command'
  'python-lightgbm: For classification.classlightgbm'
  'python-matplotlib: Enable tools.plotting, out_plot_file parameter, '`
    `'imagecalc.specunmixing.plot_endmembers, tools.mapping and '`
    `'classification.classaccuracymetrics.calc_sampled_acc_metrics'
  'python-mpl-scatter-density: For tools.mapping.create_vec_pt_density_map '`
    `'and tools.plotting.residual_density_plot'
  'python-natsort: Alternative sorter for the rsgischkgdalfile.py CLI command'
  'python-owslib: For tools.wmts_tools.get_wmts_layer_list'
  'python-pandas: For tools.sysprofile.plot_mem_cpu_profile, '`
    `'classification.plot_train_data and a few functions of tools.stats'
  'python-pillow: For add_img_to_axis/create_legend_img* in tools.plotting, '`
    `'and functions in tools.imagetools'
  'python-psutil: For tools.sysprofile.create_mem_cpu_profile'
  'python-pycurl: For tools.ftptools.download_curl_ftp_file'
  'python-pymcr: For spec_unmix_pymcr_* functions in imagecalc.specunmixing'
  'python-pysondb: For *_dwnld_db functions in dataaccess.nasa_cmr and '`
    `'*_db functions in tools.ftptools'
  'python-pysptools: For spec_unmix_spts_* functions in imagecalc.specunmixing'
  'python-cvxopt: required for what pysptools is used for in rsgislib'
  'python-pyod: For changedetect.pxloutlierchng.find_class_pyod_outliers'
  'python-pysolar: For imagecalibration.solarangles.calc_solar_azimuth_zenith'
  'python-requests: For dataaccess.nasa_cmr and tools.httptools'
  'python-rtree: For vectorgeoms.create_rtree_index/bbox_intersects_index, '`
    `'imagecalc.calc_fill_regions_knn and vectorattrs.perform_spatial_join'
  'python-scikit-image: For segmentation.skimgseg and imagecalc.leastcostpath'
  'python-scikit-optimize: Required by classification.classlightgbm and '`
    `'classification.xgboost'
  'python-scipy: For tools.stats, tools.plotting.quantile_plot, '`
    `'tools.utm.latlon_to_mode_utm_zone_number, '`
    `'imageutils.spectral_smoothing, vectorattrs.calc_npts_in_radius, '`
    `'and some zonalstats functions'
  'python-shapely: Required by vectorgeoms.split_vec_by_grid, '`
    `'vectorutils.createvectors.create_hex_grid_* and '`
    `'vectorutils.geopd_check_polys_wgs84_bounds_geometry'
  'python-statsmodels: Required by tmask (cloud masking) and '`
    `'robustfitoutliners in the timeseries subpackage'
  'python-tensorflow: For classification.classkeraspxl and '`
    `'classification.classkeraschips'
  'python-xgboost: For classification.xgboost'
  'python-matplotlib-scalebar: For tools.mapping'
)
checkdepends=('python-pytest' 'python-pytest-cov' 'python-geopandas' 'python-rtree' 'python-matplotlib')
options=(!emptydirs)
_github='https://github.com/remotesensinginfo/rsgislib'
source=("$pkgname-$pkgver.tar.gz::$_github/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('485ef32133067d9ace24db40440ee297c8708c5ec0e2a732c3303d486e41ea86')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Fix the default include/lib paths
  sed -i s-/local--g CMakeLists.txt

  # Add compatibility with Scipy v1.11+ (v1.9+ required)
  sed -i '/scipy.stats.mode/s/)/, keepdims=True&/' \
    python/rsgislib/{tools/utm,imagecalc/__init__}.py

  # Remove flip, it can be installed directly from AUR instead, and it
  # has nothing to do with all the rest of RSGISLib
  rm tools/flip.cpp
  sed -i /flip/d CMakeLists.txt
}

build() {
  mkdir -p "$srcdir/$_pkgname-$pkgver/build"
  cd "$srcdir/$_pkgname-$pkgver/build"
  cmake \
    -D Python_ROOT_DIR:FILEPATH=/usr \
    -D Python_FIND_STRATEGY=LOCATION \
    -D CMAKE_FIND_FRAMEWORK=NEVER \
    -D CMAKE_PREFIX_PATH=/usr \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BOOST_INCLUDE_DIR=/usr/include \
    -D BOOST_LIB_PATH=/usr/lib \
    -D GDAL_INCLUDE_DIR=/usr/include \
    -D GDAL_LIB_PATH=/usr/lib \
    -D HDF5_INCLUDE_DIR=/usr/include \
    -D HDF5_LIB_PATH=/usr/lib \
    -D GSL_INCLUDE_DIR=/usr/include \
    -D GSL_LIB_PATH=/usr/lib \
    -D MUPARSER_INCLUDE_DIR=/usr/include \
    -D MUPARSER_LIB_PATH=/usr/lib \
    -D KEA_INCLUDE_DIR=/usr/include \
    -D KEA_LIB_PATH=/usr/lib \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_SKIP_RPATH=ON \
    ..
  make
  chmod +x bin/*
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Prepare a directory with proper paths for testing
  rm -rf build-test
  mkdir -p build-test/{,share/}rsgislib
  ln -sr python_tests build-test/tests
  for shared_file in share/* ; do
    ln -sr "$shared_file" build-test/share/rsgislib/
    ln -sr "$shared_file" build-test/share/
  done
  find python/rsgislib/ -name '*.py' | while read _pyfile ; do
    _pytarget="${_pyfile//python/build-test}"
    mkdir -p $(dirname "$_pytarget")
    ln -f "$_pyfile" "$_pytarget"
  done
  rm build-test/rsgislib/__init__.py
  cp python/rsgislib/__init__.py build-test/rsgislib/
  echo 'RSGISLIB_INSTALL_PREFIX = "."' >> build-test/rsgislib/__init__.py
  find build/python -name '*.so' | while read _sofile ; do
    _sofilenodir="$(basename "$_sofile")"
    _sotarget="build-test/rsgislib/${_sofilenodir:1:-3}/$_sofilenodir"
    if [ ! -e "$(dirname "$_sotarget")" ] ; then
      _sotarget=${_sotarget//rsgislib/rsgislib\/imagecalc}
    fi
    ln -f "$_sofile" "$_sotarget"
  done

  # Test from current working directory (i.e., without installing)
  cd build-test
  LD_LIBRARY_PATH="$srcdir/$_pkgname-$pkgver/build/src:$LD_LIBRARY_PATH" \
             PATH="$srcdir/$_pkgname-$pkgver/build/bin:$PATH" \
       PYTHONPATH="$srcdir/$_pkgname-$pkgver/build-test:$PYTHONPATH" \
    python -m pytest --cov rsgislib
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
