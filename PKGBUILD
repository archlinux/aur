# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Martin Poljak <martin at poljak dot cz>
# Contributor: Dan Schaper <dschaper at ganymeade dot com>
pkgname=dump1090-mutability-git
_pkgbase=dump1090-mutability
pkgver=2.1.4.r225.fb5942d
pkgrel=1
pkgdesc="ADS-B/Mode S Ground Station System for simple RTL-SDR decoding/translating (Mutability Fork)."
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/mutability/dump1090"
license=('GPL' 'BSD')
depends=('rtl-sdr')
makedepends=('git')
provides=('dump1090' 'dump1090-fa' 'dump1090-fa-git' 'fatsv-data-source' 'faup1090')
backup=(etc/$_pkgbase)
install=$_pkgbase.install
source=("$pkgname::git+$url"
	"$_pkgbase"
	"$_pkgbase.service")
sha256sums=('SKIP'
	    '0e95c55fba7e3daf0a2e6f2c3f8bc60581ab52d547ec048b72eb67cc26d961a5'
	    '948dac40bf03d8b4338fc7985dc674208ff18cca37049fad22e222822ac100b4')
optdepends=(
  'lighttpd: web display support'
  'mlat-client: multilateration client'
)
changelog='dump1090-mutability.changelog'

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/faup1090-//g;s/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

build() {
  cd $pkgname
  make all faup1090 "EXTRACFLAGS=-DHTMLPATH=\\\"/usr/share/dump1090-mutability/html\\\" -DMODES_DUMP1090_VARIANT=\\\"dump1090-mutability\\\""
}

package() {
  install -Dm644 -t "$pkgdir"/etc $_pkgbase
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system $_pkgbase.service

  cd $pkgname
  install -Dm755 dump1090 "$pkgdir"/usr/bin/dump1090-mutability
  install -Dm755 view1090 "$pkgdir"/usr/bin/view1090-mutability
  install -Dm755 faup1090 "$pkgdir"/usr/lib/piaware/helpers/faup1090

  install -Dm644 -t "$pkgdir"/usr/share/$_pkgbase/html/ ./public_html/*.{js,html,gif,css}
  install -Dm644 -t "$pkgdir"/usr/share/$_pkgbase/html/coolclock/ ./public_html/coolclock/*.js
  install -Dm644 -t "$pkgdir"/usr/share/$_pkgbase/html/flags-tiny ./public_html/flags-tiny/*.{png,txt}
  install -Dm644 ./debian/lighttpd/89-dump1090.conf "$pkgdir"/usr/share/$_pkgbase/dump1090-lighttpd.conf
}
