# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgbase=acarsdec-git
pkgname=("$pkgbase-airspy" "$pkgbase-rtl-sdr")
pkgver=3.4.r124.de0c5ae
pkgrel=1
arch=('x86_64')
url="https://github.com/TLeconte/acarsdec"
license=('GPL')
makedepends=('airspy' 'git' 'libusb' 'rtl-sdr')
optdepends=('acarsserv: Store messages in sqlite database')
provides=("${pkgbase%-git}")
conflicts=("${pkgbase%-git}")
source=("$pkgbase::git+https://github.com/TLeconte/acarsdec.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags --match 'acarsdec-*' | sed 's/^acarsdec.//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$pkgbase"

  mkdir -p build-airspy
  cd build-airspy
  cmake .. -Dairspy=ON
  make
  cd ..

  mkdir -p build-rtl
  cd build-rtl
  cmake .. -Drtl=ON
  make
  cd ..
}

package_acarsdec-git-airspy() {
  pkgdesc="Multi-channel ACARS decoder with airspy backend"
  depends=('airspy' 'libusb')

  cd "$pkgbase"
  install -Dm755 build-airspy/acarsdec "$pkgdir/usr/bin/acarsdec"
}

package_acarsdec-git-rtl-sdr() {
  pkgdesc="Multi-channel ACARS decoder with rtl_sdr backend"
  depends=('rtl-sdr')

  cd "$pkgbase"
  install -Dm755 build-rtl/acarsdec "$pkgdir/usr/bin/acarsdec"
}
