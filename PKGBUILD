# Maintainer: Craig Furman <craig.furman89@gmail.com>
pkgname=networkmanager-vpn-web-ui
pkgver=0.1.0
pkgrel=2
pkgdesc="A web UI for remotely managing NetworkManager-managed VPN connections"
arch=('x86_64')
url="https://github.com/craigfurman/networkmanager-vpn-web-ui"
license=('MIT')
source=(git+$url
  $pkgname.service)
sha512sums=('SKIP'
            '9c3a3c15a4e758aaeeb8b515e3270685efae778def816b066bb1c9abc004e7b97f995f662198129f78693f8e6d6a63326e7a2ddb84c8628d75203888c4c844b7')
depends=(networkmanager)
makedepends=(git go)


_gopath=$PWD/gopath
_gopath_loc="$_gopath/src/github.com/craigfurman/$pkgname"

build() {
  mkdir -p "$(dirname "$_gopath_loc")"
  mv "$pkgname" "$(dirname "$_gopath_loc")"
  cd "$_gopath_loc"
  git checkout "v$pkgver"

  GOPATH=$_gopath make dist
}

package() {
  mkdir -p "$pkgdir/opt"
  cp -a "$_gopath_loc/dist/$pkgname" "$pkgdir/opt/"
  install -Dm644 "$_gopath_loc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
