# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=limesuite
pkgver=18.04.1
pkgrel=1
pkgdesc="Driver and GUI for LMS7002M-based SDR platforms"
arch=(any)
url="https://github.com/myriadrf/LimeSuite"
license=('MIT')
depends=('sqlite3' 'wxgtk3' 'mesa' 'libusb>=1.0' 'soapysdr')
makedepends=('git' 'cmake')
provides=('limesdr' 'soapylms7')
conflicts=('limesdr' 'soapylms7')
source=("https://github.com/myriadrf/LimeSuite/archive/v$pkgver.tar.gz")
md5sums=('529b6740ef881846ff09318515baf7f0')

build() {
  mkdir -p "$srcdir/LimeSuite-$pkgver/build"
  cd "$srcdir/LimeSuite-$pkgver/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIME_SUITE_EXTVER="$pkgver"

  make
}

package() {
  cd "$srcdir/LimeSuite-$pkgver/build"

  make DESTDIR="$pkgdir" install

  # Install udev rules, changing mode to 666 and ommitting plugdev group
  mkdir -p "${pkgdir}/etc/udev/rules.d"
  sed 's/MODE="660", GROUP="plugdev"/MODE="666"/g' "${srcdir}/${pkgname}/udev-rules/64-limesuite.rules" > "${pkgdir}/etc/udev/rules.d/64-limesuite.rules"
}
