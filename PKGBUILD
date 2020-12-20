# Maintainer: Kyle Keen <keenerd@gmail.com?>
pkgname=gnuradio-iio-git
_gitname=gr-iio
pkgver=20201109 
pkgrel=1
pkgdesc="IIO blocks for GNU Radio"
url="https://github.com/analogdevicesinc/gr-iio"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libad9361-iio')
makedepends=('git' 'cmake' 'boost' 'swig')
provides=('gnuradio-iio')
conflicts=('gnuradio-iio')
source=("git+https://github.com/analogdevicesinc/gr-iio.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

prepare() {
  cd "$_gitname"
  sed -i 's|gnuradio/analog/sig_source_f.h|gnuradio/analog/sig_source.h|' lib/iio_math_impl.cc
  sed -i 's|gnuradio/blocks/add_ff.h|gnuradio/blocks/add_blk.h|' lib/iio_math_impl.cc
  sed -i 's|gnuradio/blocks/divide_ff.h|gnuradio/blocks/divide.h|' lib/iio_math_impl.cc
  sed -i 's|gnuradio/blocks/multiply_const_ff.h|gnuradio/blocks/multiply_const.h|' lib/iio_math_impl.cc
  sed -i 's|gnuradio/blocks/multiply_ff.h|gnuradio/blocks/multiply.h|' lib/iio_math_impl.cc
  sed -i 's|gnuradio/blocks/sub_ff.h|gnuradio/blocks/sub.h|' lib/iio_math_impl.cc
  sed -i 's|gnuradio/analog/sig_source_f.h|gnuradio/analog/sig_source.h|' lib/iio_math_gen_impl.cc
  2to3 -w ./python/iio/{__init__,attr_updater}.py
}

build() {
  cd "$_gitname"
  mkdir -p build
  cd build
  export PYTHON=python3
  cmake \
    -DPYTHON_EXECUTABLE=$(which python3) \
    -DPYTHON_INCLUDE_DIR=$(echo /usr/include/python3*) \
    -DPYTHON_LIBRARY=$(echo /usr/lib/libpython3.*.so) \
    -DGNURADIO_RUNTIME_INCLUDE_DIRS=/usr/include \
    -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ../
  make
}

package() {
  cd "$_gitname/build"
  make DESTDIR="${pkgdir}" install
}
