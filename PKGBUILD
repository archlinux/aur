# Maintainer: detiam <dehe_tian@outlook.com>

_pkgname=phantomsocks
pkgname=phantomsocks-ipv6-git
pkgver=r293.dc07f6f
pkgrel=1
pkgdesc="A cross-platform proxy client/server for Linux/Windows/macOS (able to use ipv4 and ipv6 same time)"
arch=(i686 x86_64)
url="https://github.com/detiam/$_pkgname"
license=('LGPL-3.0')

provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
depends=('systemd')
makedepends=('go' 'git' 'libpcap')

source=(
	"git+$url"
	"$_pkgname.sysusers"
	"$_pkgname.service"
	"$_pkgname@.service")
sha256sums=('SKIP'
            '48d8ee51fa847c6060eca752f5c39340626938f2a8b3583150bc15d3d9ecceac'
            '11e73f1c325e8d514b30c60f2e236b7cd6cd2c2f17443b97c1a628004f9128fc'
            '038dafefdf359d5a3a427507cfb558263f93d338cf5f18ed525ab7d0335d3e8d')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
	cd "$_pkgname"
	go build -tags pcap
}

package() {
	cd "$_pkgname"

	install -Dm644 "../$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -Dm644 "../$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"

	install -dm755 "$pkgdir/etc/phantomsocks"
	install -dm755 "$pkgdir/usr/lib/systemd/system"
	install -Dm600 "config.json" "$pkgdir/etc/phantomsocks/config.json"
	install -Dm600 "default.conf" "$pkgdir/etc/phantomsocks/default.conf"

	install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/phantomsocks.conf"

	install -dm755 "$pkgdir/usr/bin"
	install "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
