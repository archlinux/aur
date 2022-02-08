# Maintainer: dobedobedo <dobe0331 at gmail dot com>
# Contributor: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_pkgname='rsgislib'
pkgname=("python-$_pkgname")
pkgver=5.0.4
pkgrel=1
_rsgislib="Remote Sensing and GIS collection of tools for processing datasets"
pkgdesc="$_rsgislib including its Python bindings"
arch=('i686' 'x86_64')
url='http://www.rsgislib.org'
license=('GPL3')
makedepends=('cmake' 'boost' 'python')
depends=('hdf5' 'kealib' 'xerces-c' 'muparser' 'gsl' 'geos' 'gdal' 'cgal' 'python'
         'boost-libs' 'python-numpy' 'python-scikit-learn' 'python-tqdm' 'python-rios')
options=(!emptydirs)
source=("https://github.com/remotesensinginfo/rsgislib/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6ce4c5b108231d043aa5802d783c18cf9bf7166ef852dec1c0a8924fff881021')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Fix the default include/lib paths
  sed -i s-/local--g CMakeLists.txt
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
    "$srcdir/$_pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
