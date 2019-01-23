# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=meteoio
pkgname=('meteoio' 'meteoio-examples' 'meteoio-docs')
pkgver=2.8.0
pkgrel=1
pkgdesc="Make data access easy and safe for numerical simulations in environmental sciences"
arch=('x86_64')
url="https://models.slf.ch/p/meteoio/"
license=('LGPL3')
makedepends=('cmake' 'doxygen')
source=("https://models.slf.ch/p/meteoio/downloads/get/MeteoIO-$pkgver-src.tar.gz" exclude_random_numbers.patch)

prepare() {
  cd "MeteoIO-$pkgver-src"
  patch -p1 < "$srcdir/exclude_random_numbers.patch"
}

build() {
  cd "MeteoIO-$pkgver-src"
  mkdir -p build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_DOC=1 .
  make
  make doc
  cd doc/examples
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package_meteoio() {
  cd "MeteoIO-$pkgver-src"
  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir/usr/share"
}

package_meteoio-examples() {
  cd "MeteoIO-$pkgver-src/doc/examples/build"
  install -vDm644 ../io.ini "$pkgdir/usr/share/meteoio/io.ini"
  for example in 2D_interpolations coordinates data_converter dem_reading grid2d_reading matrix meteo_reading sun time; do
    install -vDm755 $example "$pkgdir/usr/bin/meteoio_$example"
  done
}

package_meteoio-docs() {
  cd "MeteoIO-$pkgver-src/doc/html"
  mkdir -p "$pkgdir/usr/share/doc/meteoio"
  cp -r * "$pkgdir/usr/share/doc/meteoio"
}

sha256sums=('4a74896b678bb1b4c9a2248582df76ad2025e6f66aa176049500557f041a98da'
            '77a043c0f6e5c9d52884e8e149a031aff8ade2d3f86455bf6815db59198103ba')
