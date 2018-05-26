# Maintainer: FFY00 <filipe.lains@gmail.com>

pkgname=soapysdr
pkgver=0.6.1
_gver=soapy-sdr-$pkgver
pkgrel=1
pkgdesc="Vendor and platform neutral SDR support library"
arch=(any)
url="https://github.com/pothosware/SoapySDR"
license=('GPL3')
makedepends=('cmake')
optdependes=(
  'swig: bindings'
  'python: python bindings'
  'doxygen: documentation'
)
provides=('soapysdr')
conflicts=('soapysdr')
source=(
  "https://github.com/pothosware/SoapySDR/archive/$_gver.tar.gz"
  'git_revision.patch'
)
sha256sums=(
  '2ecf8e43518dfb24bd172923adf6ce25a6d3e39de3a8aadf26c890f60dd1e9f7'
  '56bd3fef417f2414dc3b3ab8ea3f455064b0d22f74489a72bfd83882701f3b03'
)

prepare() {
  sed -i "s/SOURCE_FOLDER/SoapySDR-$_gver/g" git_revision.patch
  patch -p0 < git_revision.patch
}

build() {
  mkdir -p $srcdir/SoapySDR-$_gver/build
  cd $srcdir/SoapySDR-$_gver/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd $srcdir/SoapySDR-$_gver/build

  make DESTDIR=$pkgdir install

  install -dm 644 $pkgdir/usr/share/licenses/soapysdr
  install -Dm 644 $srcdir/SoapySDR-$_gver/LICENSE_1_0.txt $pkgdir/usr/share/licenses/soapysdr/
}
