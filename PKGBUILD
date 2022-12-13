# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: dobedobedo <dobe0331 at gmail dot com>
pkgname=('kealib')
pkgver=1.5.0
pkgrel=1
pkgdesc="An HDF5 Based Raster File Format and its GDAL plugin"
arch=('i686' 'x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('cmake')
depends=('hdf5' 'gdal')
options=(!emptydirs)
source=("https://github.com/ubarsc/kealib/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d19a0fb051019f87fe413bda76472bf4fff8fca52ede92e0ffd983caeafd05b8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -D BUILD_SHARED_LIBS=ON \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D GDAL_INCLUDE_DIR=/usr/include \
        -D HDF5_INCLUDE_DIR=/usr/include \
        -D KEAHDF5_STATIC_LIBS=OFF \
        -D LIBKEA_HEADERS_DIR=../include \
        -D LIBKEA_LIB_PATH=../src \
        -D LIBKEA_WITH_GDAL=ON \
        .
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
