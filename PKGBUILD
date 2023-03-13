# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: detian <dehe_detian@outlook.com>
pkgname=phantomsocks-git
_pkgname=phantomsocks
pkgver=r282.3c556b0
pkgrel=1
epoch=
pkgdesc="A cross-platform proxy client/server for Linux/Windows/macOS"
arch=(i686 x86_64)
url="https://github.com/macronut/$_pkgname"
#_commit=a521259ffc1cfd8753845997c09644b976af2d6c
license=('LGPL-3.0')
groups=()
depends=('systemd')
makedepends=('go' 'git')
checkdepends=()
optdepends=(
	'v2raya: for use with v2raya'
	'libpcap: you can build pcap version if you want, see PKGBUILD build()'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
backup=()
options=()
install=
changelog=
source=(
	"git+$url"
	"$_pkgname.sysusers"
    "$_pkgname.service"
    "$_pkgname@.service"
)
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
validpgpkeys=()

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
