# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=meteoio
pkgname=('meteoio' 'meteoio-examples' 'meteoio-docs')
pkgver=2.9.0
pkgrel=2
pkgdesc="Make data access easy and safe for numerical simulations in environmental sciences"
arch=('x86_64')
url="https://models.slf.ch/p/meteoio/"
license=('LGPL3')
makedepends=('cmake' 'doxygen')
source=("https://gitlabext.wsl.ch/snow-models/meteoio/-/archive/MeteoIO-$pkgver/meteoio-MeteoIO-$pkgver.tar.gz")
sha256sums=('d7466720899689143514da658e8473ce2db8e9b40f4131924537198dc9c1f164')

prepare() {
  cd "meteoio-MeteoIO-$pkgver"
}

build() {
  cd "meteoio-MeteoIO-$pkgver"
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
  cd "meteoio-MeteoIO-$pkgver"
  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir/usr/share"
}

package_meteoio-examples() {
  cd "meteoio-MeteoIO-$pkgver/doc/examples/build"
  install -vDm644 ../io.ini "$pkgdir/usr/share/meteoio/io.ini"
  for example in 2D_interpolations coordinates data_converter dem_reading grid2d_reading matrix meteo_reading sun time; do
    install -vDm755 $example "$pkgdir/usr/bin/meteoio_$example"
  done
}

package_meteoio-docs() {
  cd "meteoio-MeteoIO-$pkgver/doc/html"
  mkdir -p "$pkgdir/usr/share/doc/meteoio"
  cp -r * "$pkgdir/usr/share/doc/meteoio"
}

