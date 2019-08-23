# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=gr-limesdr
pkgver=2.0.0
pkgrel=1
pkgdesc='gr-limesdr Plugin for GNURadio'
arch=('any')
url='https://github.com/myriadrf/gr-limesdr'
license=('MIT')
depends=('boost' 'gnuradio' 'limesuite')
makedepends=('cmake' 'swig') # 'doxygen' 'graphviz'
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('da7dae14af903119e482aed8a2029cf1a188ac28e74fdc2f369c7de77b5eadde9dcca7503d6528d882d8b3a3b371dd66020772c8dc849b284761c4f5f393d180')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|%include "gnuradio.i"|%include "/usr/include/gnuradio/swig/gnuradio.i"|' \
    swig/limesdr_swig.i

  rm -rf docs/doxygen/doxyxml
  ln -s /usr/share/gnuradio/modtool/templates/gr-newmod/docs/doxygen/doxyxml docs/doxygen/doxyxml
}

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd $pkgname-$pkgver/build

  make DESTDIR="$pkgdir" install

  install -Dm 644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
