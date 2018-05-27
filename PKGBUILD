# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('kealib')
pkgver=1.4.7
pkgrel=1
pkgdesc="An HDF5 Based Raster File Format and its GDAL plugin"
arch=('i686' 'x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('hdf5-cpp-fortran' 'gdal' 'cmake')
depends=('hdf5-cpp-fortran' 'gdal')
options=(!emptydirs)
source=("https://bitbucket.org/chchrsc/kealib/downloads/kealib-$pkgver.tar.gz")
sha256sums=('ec38751b3b555d3a26f0c7445f2d2cd9d7c3a3502237519a206a50cb58df56ec')
_srcpath=$pkgname-$pkgver/trunk

prepare() {
  cd "$srcdir/$_srcpath"

  # Creates a standalone license file joining the copyright message
  # from everywhere in the code
  grep -rh -B1 -A22 'Copyright ' | sed 's/^[ *#]*//g;s/\r//g' > LICENSE
}

build() {
  cd "$srcdir/$_srcpath"
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_SKIP_RPATH=ON \
        -D CMAKE_CXX_STANDARD=11 \
        -D HDF5_INCLUDE_DIR=/usr/include \
        -D HDF5_LIB_PATH=/usr/lib \
        -D GDAL_INCLUDE_DIR=/usr/include \
        -D GDAL_LIB_PATH=/usr/lib \
        -D LIBKEA_WITH_GDAL=TRUE \
        .
  make
}

package() {
  cd "$srcdir/$_srcpath"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
