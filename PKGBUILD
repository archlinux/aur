# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('kealib')
pkgver=1.4.9
pkgrel=1
pkgdesc="An HDF5 Based Raster File Format and its GDAL plugin"
arch=('i686' 'x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('hdf5-cpp-fortran' 'gdal' 'cmake')
depends=('hdf5-cpp-fortran' 'gdal')
options=(!emptydirs)
source=("https://bitbucket.org/chchrsc/kealib/downloads/kealib-$pkgver.tar.gz")
sha256sums=('1c80489f17114a229097c2e8c61d5e4c82ea63ae631c81a817fef95cfd527174')
_srcpath=$pkgname-$pkgver

prepare() {
  # The C++ standard required for compilation should be 11
  # since the code uses stuff like static_assert and nullptr,
  # but CMakeLists.txt hardcoded the 98 standard
  sed -i /CMAKE_CXX_STANDARD.98/d "$srcdir/$_srcpath/CMakeLists.txt"
}

build() {
  cd "$srcdir/$_srcpath"
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_SKIP_RPATH=ON \
        -D CMAKE_CXX_STANDARD=11 \
        -D HDF5_INCLUDE_DIR=/usr/include \
        -D GDAL_INCLUDE_DIR=/usr/include \
        -D LIBKEA_WITH_GDAL=TRUE \
        .
  make
}

package() {
  cd "$srcdir/$_srcpath"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
