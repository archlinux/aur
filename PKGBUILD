# Maintainer: detiam <dehe_tian@outlook.com>

_pkgname=phantomsocks
pkgname=phantomsocks-ipv6-git
pkgver=r295.bb0361c
pkgrel=1
pkgdesc="A cross-platform proxy client/server for Linux/Windows/macOS (resolve both ipv4 and ipv6 dns record)"
arch=(i686 x86_64)
url="https://github.com/detiam/$_pkgname"
license=('LGPL-3.0')

provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
makedepends=('go' 'git')
depends=('systemd' 'jq')
optdepends=(
	'libpcap: you can build pcap version if you want, see PKGBUILD build()'
)

install=$_pkgname.install
source=(
	"git+$url#branch=v6"
	"$_pkgname-init.sh"
	"$_pkgname.service")
sha256sums=('SKIP'
            'cb7352c6bdcf82fb47bdc7aedd962c41b433e78d9e41f7a3acbec8d409afc240'
            '4602cf1421b16780aea3eef1d69ed44197efa6cbfe5e64193a127852ba71750c')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
	cd "$_pkgname"
	# Choose between them
	go build -tags rawsocket
	#go build -tags pcap
}

package() {
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/lib/systemd/user"
	install -dm755 "$pkgdir/usr/share/phantomsocks"

	install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/user/"
	install "$_pkgname-init.sh" "$pkgdir/usr/bin/$_pkgname-init"

	cd "$_pkgname"

	install -Dm644 "config.json" "$pkgdir/usr/share/phantomsocks"
	install -Dm644 "default.conf" "$pkgdir/usr/share/phantomsocks"

	install "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
