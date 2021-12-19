# Maintainer: Grey Christoforo <first name at last name dot net>

_pkgname=gnuradio-iio
pkgname=gnuradio-iio-patched-3.8

pkgver=r240.d6d1f6a
pkgrel=2

_commit=d6d1f6ac7db5be3eb990ee8ef78bb65cf3a15dd7

pkgdesc="IIO blocks for GNU Radio (Patched for Gnuradio version 3.8, not compatible with 3.9-git)"

url="https://github.com/analogdevicesinc/gr-iio"
arch=(x86_64)
license=(GPL3)
depends=(
gnuradio38
libad9361
)
makedepends=(git cmake boost swig)

provides=(gnuradio-iio)
conflicts=(gnuradio-iio gnuradio-iio-git gnuradio-git)

source=(
  "$_pkgname::git+https://github.com/analogdevicesinc/gr-iio.git#commit=$_commit"
  0001-several-fixes.patch
)
sha256sums=('SKIP'
            '691af280cab551c50f6469632b6624c3957f6e9725998f45574e21abdec7965c')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count $_commit)" "$(git rev-parse --short $_commit)"
}

prepare() {
  cd "$_pkgname"
  patch -p1 -i ../0001-several-fixes.patch
}



build() {
  cd "$_pkgname"
  mkdir -p build
  cd build
  export PYTHON=python3
  cmake \
    -DPYTHON_EXECUTABLE=$(which python3) \
    -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ../
  make
}

package() {
  cd "$_pkgname/build"
  make DESTDIR="${pkgdir}" install

  mkdir -p ${pkgdir}/usr/share/gnuradio/examples/iio
  cp ../iio-examples/* ${pkgdir}/usr/share/gnuradio/examples/iio/
}

