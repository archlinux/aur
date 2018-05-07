# Maintainer: Craig Furman <craig.furman89@gmail.com>
pkgname=networkmanager-vpn-web-ui
pkgver=0.1.0
pkgrel=3
pkgdesc="A web UI for remotely managing NetworkManager-managed VPN connections"
arch=('x86_64')
url="https://github.com/craigfurman/networkmanager-vpn-web-ui"
license=('MIT')
source=("https://github.com/craigfurman/$pkgname/archive/v$pkgver.tar.gz"
  $pkgname.service)
sha512sums=('faa29c07be2e5b85ba565d0ee0aab3e958e4a40060c13a888e82cadc886bd2df835e582a61894e6ba2694e97f83ef6dac081b7443ef04ff328da57c1f3e00f70'
            '9c3a3c15a4e758aaeeb8b515e3270685efae778def816b066bb1c9abc004e7b97f995f662198129f78693f8e6d6a63326e7a2ddb84c8628d75203888c4c844b7')
depends=(networkmanager)
makedepends=(go-pie)

build() {
  _gopath=$srcdir/gopath
  _gopath_loc="$_gopath/src/github.com/craigfurman/$pkgname"

  mkdir -p "$(dirname "$_gopath_loc")"
  mv "${pkgname}-${pkgver}" "$_gopath_loc"
  cd "$_gopath_loc"

  GOPATH=$_gopath make dist
}

package() {
  _gopath=$srcdir/gopath
  _gopath_loc="$_gopath/src/github.com/craigfurman/$pkgname"

  mkdir -p "$pkgdir/opt"
  cp -a "$_gopath_loc/dist/$pkgname" "$pkgdir/opt/"
  install -Dm644 "$_gopath_loc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
