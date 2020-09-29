# Maintainer: tmikey

_pkgname=mos-chinadns
pkgname=$_pkgname
pkgver=1.5.2
pkgrel=1
pkgdesc="Provides a local DNS server that prevents GFW DNS poisoning"
arch=('x86_64' 'aarch64')
url="https://github.com/IrineSistiana/mos-chinadns"
license=('GPL3')
depends=('python-netaddr' 'python-requests')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
pkgbasename=$_pkgname-$pkgver
source=("$pkgbasename.tar.gz::$url/archive/v$pkgver.tar.gz"
  "$_pkgname.install"
  "$_pkgname.service"
  "$_pkgname.yaml"
  )
sha256sums=('145ff178ecf80cde091f0b99f50cd479132c90f688a01ee744644f2f7bfd5c1f'
            'b090d24740b96f289b62b0dde73c4e1f372bb640ac631c49bb36351f56c07c17'
            '7302819d1dd3a98abb18847ff435e1630e58208aef2fe33451aa8314acd8d6e3'
            '3b12eb4b41136391bda12edbb77bf89a89335875aff654677f3f70fe020cd548')

prepare() {
  cd "$pkgbasename"
  python3 scripts/update_chn_ip_domain.py
}

build() {
  cd "$pkgbasename"
  go build -ldflags "-s -w -X main.version=$pkgver" -trimpath -o $_pkgname
}

package() {
  cd "$pkgbasename"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/share/licenses"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -Dm755 -t "$pkgdir/usr/bin" $_pkgname
  install -Dm644 -t "$pkgdir/usr/lib/$_pkgname" README.md "$srcdir/$_pkgname.yaml" chn.list chn_domain.list
  install -Dm755 -t "$pkgdir/usr/lib/$_pkgname" scripts/update_chn_ip_domain.py
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/mos-chinadns.service"
}

# vim:set ts=2 sw=2 et:
