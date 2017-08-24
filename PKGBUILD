# Maintainer: Kyle Keen <keenerd@gmail.com?>
pkgname=gnuradio-osmosdr-gqrx-git
_pkgname=gr-osmosdr-gqrx
pkgver=20170612
pkgrel=1
pkgdesc="Tweaked osmosdr for AD Pluto support (temporary)"
url="https://github.com/csete/gr-osmosdr-gqrx"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnuradio' 'gnuradio-iqbal' 'rtl-sdr' 'gnuradio-fcdproplus' 'hackrf' 'bladerf' 'airspy' 'gnuradio-iio')
optdepends=('python2-opengl: osmocom_fft')
makedepends=('git' 'cmake' 'boost' 'python2-cheetah' 'swig')
provides=('gnuradio-osmosdr')
conflicts=('gnuradio-osmosdr')
source=("git+https://github.com/csete/gr-osmosdr-gqrx.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's/python$/python2/' apps/osmocom_siggen_base.py

  # make it work with the old drivers
  sed -i 's/rtlsdr_set_bias_tee.*;/0;/' lib/rtl/rtl_source_c.cc
}

build() {
  cd "$srcdir/$_pkgname"
  git checkout plutosdr
  mkdir -p build
  cd build
  cmake \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_EXECUTABLE=$(which python2) \
    -DPYTHON_INCLUDE_DIR=$(echo /usr/include/python2*) \
    -DPYTHON_LIBRARY=$(echo /usr/lib/libpython2.*.so) \
    -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$srcdir/$_pkgname/build/"
  make DESTDIR="${pkgdir}" install
}
