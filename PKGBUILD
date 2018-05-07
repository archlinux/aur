# Maintainer: Craig Furman <craig.furman89@gmail.com>
pkgname=networkmanager-vpn-web-ui
pkgver=0.1.1
pkgrel=1
pkgdesc="A web UI for remotely managing NetworkManager-managed VPN connections"
arch=('x86_64')
url="https://github.com/craigfurman/networkmanager-vpn-web-ui"
license=('MIT')
source=("https://github.com/craigfurman/$pkgname/archive/v$pkgver.tar.gz"
  $pkgname.service)
sha512sums=('45556365e779f9644d62c3f2d4314f2a9edf3690d3164f01fc7788deb35219f9ebac6681f9f916754cee4bb95e9cba15e37cbef491e4d3c7c275e6a0484b7d12'
            '203e0b0d6252b066d70968571481a50fd2c5402e3b44a5c6e5322e1ee0bf488719f863f5eedd01d10f256cd54362e8762cd58c890ad5f49a64e5aca73b16dfa9')
depends=(networkmanager)
makedepends=(go-pie)

build() {
  _gopath=$srcdir/gopath
  _gopath_loc="$_gopath/src/github.com/craigfurman/$pkgname"

  mkdir -p "$(dirname "$_gopath_loc")"
  mv "${pkgname}-${pkgver}" "$_gopath_loc"
  cd "$_gopath_loc"

  GOPATH=$_gopath NMUI_STATIC_FILES_DIR=/usr/share/$pkgname/public make dist
}

package() {
  dist_dir=$srcdir/gopath/src/github.com/craigfurman/$pkgname/dist/$pkgname

  install -D "$dist_dir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -a "$dist_dir/public" "$pkgdir/usr/share/$pkgname"
  install -Dm644 "$dist_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
