# Maintainer: Dan Printzell <arch@vild.io>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Mihails Strasuns <public@dicebot.lv>

pkgname=('dcd')
pkgver=0.9.1
pkgrel=1
_pkgcommit=9f4c6ddaf43544682de37d864d33b52e9648ca10
pkgdesc="D Completion Daemon: auto-complete for the D programming language"
arch=('i686' 'x86_64')
url="https://github.com/Hackerpilot/DCD"
license=('GPL3')
groups=('dlang')
makedepends=('dmd' 'git')
depends=('libphobos')

source=(
	"git+https://github.com/dlang-community/DCD#commit=$_pkgcommit"
	"git+https://github.com/msgpack/msgpack-d"
	"git+https://github.com/economicmodeling/containers"
	"git+https://github.com/dlang-community/libdparse"
	"git+https://github.com/dlang-community/dsymbol"
	"dcd.service"
	"dcd.conf"
)

sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'7d3483ee92e42101d07395775aac5f0b277780f847c3823879fb35d1f2a9fbb3'
	'fb765020c49a918b157f5be2cabd71c16bbb050ddd762f1e08c84d1eddd4c97b'
)

prepare() {
	cd "$srcdir/DCD"

	git submodule init
	git config submodule.msgpack-d.url "$srcdir/msgpack-d"
	git config submodule.containers.url "$srcdir/containers"
	git config submodule.libdparse.url "$srcdir/libdparse"
	git config submodule.dsymbol.url "$srcdir/dsymbol"
	git submodule update
}

build() {
	cd "$srcdir/DCD"

	make dmd
}

package() {
	# binaries
	install -Dm755 "$srcdir/DCD/bin/dcd-server" "$pkgdir/usr/bin/dcd-server"
	install -Dm755 "$srcdir/DCD/bin/dcd-client" "$pkgdir/usr/bin/dcd-client"

	# documentation
	install -d "$pkgdir/usr/share/man/man1/"
	find "$srcdir/DCD/man1/" -type f -exec install -m 644 "{}" "$pkgdir/usr/share/man/man1/" \;

	# license
	install -Dm644 "$srcdir/DCD/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# systemd service
	install -Dm644 "$srcdir/dcd.service" "$pkgdir/usr/lib/systemd/system/dcd.service"

	# global config
	install -Dm644 "$srcdir/dcd.conf" "$pkgdir/etc/dcd.conf"
}
