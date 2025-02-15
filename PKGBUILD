# Maintainer: J. Gerhards <g1.jasger@gmail.com>
# Author: J. Gerhards <g1.jasger@gmail.com>

pkgname=mpdris
_pkgname=mpDris
pkgver=1.2.0
pkgrel=1
pkgdesc='A MPD client implementing the dbus MPRIS standard written in rust'
url='https://github.com/jasger9000/mpDris'
license=('MIT')
arch=('any')
provides=('mpdris')
conflicts=('mpdris-bin' 'mpdris-git')
depends=('glibc' 'gcc-libs')
optdepends=('libsystemd: run mpdris as a service')
makedepends=('cargo')
source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"mpdris.service")
sha256sums=('e5d6ddcb237b8d969eec82ad07300e113d23c1b3019ba1ca2fe874b7701ff582'
	'29fb19d923984a0d58edf647be99f916d82c37b04e58abb40f793517c8e0a903')
_hash='6b0652d'

build() {
  cd $_pkgname-$pkgver
  GIT_HASH=$_hash cargo build --release --locked
}

package() {
  depends+=('dbus' 'mpd')
  cd $_pkgname-$pkgver

  install -Dm755 "target/release/mpdris" "$pkgdir/usr/bin/mpdris"
  install -Dm644 "../mpdris.service" "$pkgdir/usr/lib/systemd/user/mpdris.service"
  install -Dm644 "resources/sample.mpDris.conf" "$pkgdir/usr/share/doc/${pkgname}/sample.mpDris.conf"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
