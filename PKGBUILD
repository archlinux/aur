# Maintainer: Craig Furman <craig.furman89@gmail.com>
pkgname=networkmanager-vpn-web-ui
pkgver=0.1.3
pkgrel=1
pkgdesc="A web UI for remotely managing NetworkManager-managed VPN connections"
arch=('x86_64')
url="https://gitlab.com/craigfurman/networkmanager-vpn-web-ui"
license=('MIT')
source=("https://gitlab.com/craigfurman/networkmanager-vpn-web-ui/-/archive/v0.1.3/networkmanager-vpn-web-ui-v0.1.3.tar.gz"
  $pkgname.service)
sha512sums=('2072eaab3247271373bdb2985bd94f7d64c3695d7b610a1d1de8078a48a223977d420f4fd2c907771fd1853dd03cc1563dda5c4e9fe4915acacf2a5bb5d84a24'
            '203e0b0d6252b066d70968571481a50fd2c5402e3b44a5c6e5322e1ee0bf488719f863f5eedd01d10f256cd54362e8762cd58c890ad5f49a64e5aca73b16dfa9')
depends=(networkmanager)
makedepends=(go-pie)

build() {
  _gopath=$srcdir/gopath
  _gopath_loc="$_gopath/src/gitlab.com/craigfurman/$pkgname"

  mkdir -p "$(dirname "$_gopath_loc")"
  mv "${pkgname}-v${pkgver}" "$_gopath_loc"
  cd "$_gopath_loc"

  GOPATH=$_gopath NMUI_STATIC_FILES_DIR=/usr/share/$pkgname/public make dist
}

package() {
  dist_dir=$srcdir/gopath/src/gitlab.com/craigfurman/$pkgname/dist/$pkgname

  install -D "$dist_dir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -a "$dist_dir/public" "$pkgdir/usr/share/$pkgname"
  install -Dm644 "$dist_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
