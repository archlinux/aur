# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgbase=acarsdec-git
pkgname=("$pkgbase-airspy" "$pkgbase-rtl-sdr")
pkgver=3.4.r91.ac7f7a2
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

  make -f Makefile.air
  cp acarsdec acarsdec-airspy
  make -f Makefile.air clean

  make -f Makefile.rtl
  cp acarsdec acarsdec-rtl-sdr
  make -f Makefile.rtl clean
}

package_acarsdec-git-airspy() {
  pkgdesc="Multi-channel ACARS decoder with airspy backend"
  depends=('airspy' 'libusb')

  cd "$pkgbase"
  install -Dm755 acarsdec-airspy "$pkgdir/usr/bin/acarsdec"
}

package_acarsdec-git-rtl-sdr() {
  pkgdesc="Multi-channel ACARS decoder with rtl_sdr backend"
  depends=('rtl-sdr')

  cd "$pkgbase"
  install -Dm755 acarsdec-rtl-sdr "$pkgdir/usr/bin/acarsdec"
}
