# Maintainer: Dan Printzell <xwildn00bx@gmail.com>
#Contributor: Mihails Strasuns <public@dicebot.lv>

pkgname=('dcd-git')
pkgver=r664.69d195f
pkgrel=1
pkgdesc="D Completion Daemon: auto-complete for the D programming language"
arch=('i686' 'x86_64')
url="https://github.com/Hackerpilot/DCD"
license=("GPL3")
groups=('dlang')
makedepends=('dmd' 'git')
depends=('libphobos')
provides=('dcd')
conflicts=('dcd')
options=('!strip')

source=(
	"git+https://github.com/Hackerpilot/DCD"
	"dcd.service"
	"dcd.conf"
)
sha256sums=(
	'SKIP'
	'7d3483ee92e42101d07395775aac5f0b277780f847c3823879fb35d1f2a9fbb3'
	'fb765020c49a918b157f5be2cabd71c16bbb050ddd762f1e08c84d1eddd4c97b'
)

pkgver() {
	cd $srcdir/DCD
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/DCD
	git submodule update --init --recursive
}

build() {
	cd $srcdir/DCD
	make
}

package(){
	cd $srcdir/DCD

	# binaries
	mkdir -p $pkgdir/usr/bin
	install -m755 -t $pkgdir/usr/bin ./bin/dcd-server
	install -m755 -t $pkgdir/usr/bin ./bin/dcd-client

	# documentation
	mkdir -p $pkgdir/usr/share/man/man1
	install -Dm644 man1/* $pkgdir/usr/share/man/man1/

	# systemd service
	install -Dm644 $srcdir/dcd.service ${pkgdir}/usr/lib/systemd/system/dcd.service

	# global config
	install -Dm644 $srcdir/dcd.conf ${pkgdir}/etc/dcd.conf
}
