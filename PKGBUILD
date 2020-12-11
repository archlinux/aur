# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: git
pkgname=transmission-trackers-git
pkgver=r25.0d17bae
pkgrel=1
pkgdesc="Automatically add trackers from a list to all torrents in Transmission"
arch=('any')
url="https://github.com/blind-oracle/transmission-trackers"
license=('unknown')
depends=(
	'systemd'
	'transmission-cli'
	'python-transmissionrpc'
	'python-toml'
)
makedepends=('git')
provides=('transmission-trackers')
conflicts=('transmission-trackers')
install=${pkgname%*-git}.install
source=(
	"transmission-trackers::git+https://github.com/blind-oracle/transmission-trackers.git"
	"transmission-trackers.service"
	"transmission-trackers.timer"
)
sha256sums=('SKIP'
            '52304cf9430f274eb90cb0929787560703b74230b2485a2c4633793c876c4900'
            '0b7ff86930e1732c65d323c8641b43ec5f3aa2a6c9a8b108b0421ca92d977db4')

pkgver()
{
	cd "$srcdir/${pkgname%*-git}"
	( set -o pipefail
		git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	install -Dm755 "$srcdir/${pkgname%*-git}/transmission-trackers.py" "$pkgdir/usr/bin/transmission-trackers"
	install -Dm644 "$srcdir/transmission-trackers.service" "$pkgdir/usr/lib/systemd/user/transmission-trackers.service"
	install -Dm644 "$srcdir/transmission-trackers.timer"   "$pkgdir/usr/lib/systemd/user/transmission-trackers.timer"
}
