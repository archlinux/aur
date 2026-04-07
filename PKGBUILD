# Maintainer: daedalao <daedalao@daedalaomain>
pkgname=djcmd-git
pkgver=r1.0
pkgrel=1
pkgdesc="A full-featured terminal DJ application for Linux"
arch=('x86_64' 'aarch64' 'armv7h' 'powerpc' 'ppc64le')
url="https://github.com/djcmd-project/djcmd"
license=('GPL-3.0-only')
depends=('alsa-lib' 'ncurses' 'sqlite')
makedepends=('git')
provides=('djcmd')
conflicts=('djcmd')
source=("git+https://github.com/djcmd-project/djcmd.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/djcmd"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/djcmd"

	case "$CARCH" in
		x86_64)
			make x86_64
			;;
		aarch64)
			make aarch64
			;;
		armv7h)
			make rpi4
			;;
		powerpc)
			make powerpc
			;;
		ppc64le)
			make
			;;
		*)
			make
			;;
	esac
}

package() {
	cd "$srcdir/djcmd"

	install -Dm755 djcmd "$pkgdir/usr/bin/djcmd"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	if [ -f "mixtrack_3.map" ]; then
		install -Dm644 mixtrack_3.map "$pkgdir/usr/share/$pkgname/maps/mixtrack_3.map"
	fi
}
