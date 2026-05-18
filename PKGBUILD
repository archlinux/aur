# Maintainer: aaaaa <please@ignore.pl>
_pkgname=beansprout
pkgname=$_pkgname-git
pkgver=v0.2.3.r25.gdc2ec40
pkgrel=1
pkgdesc='a DWM-style tiling window manager with built-in wallpaper and a clock/bar with configuration in Kdl'
arch=('x86_64')
url='https://codeberg.org/beansprout/beansprout'
license=(GPL-3.0-only CC-BY-4.0 CC0-1.0)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(wayland pixman libxkbcommon-x11 fcft river)
makedepends=(wayland-protocols zig)
source=('git+https://codeberg.org/beansprout/beansprout.git' 'beansprout.desktop')
sha256sums=('SKIP'
            '916d7ffef83f534e34a2e858f74ce2a49b1d5035db15ab40ef095a70f9f74f00')
zigflags=-Doptimize=ReleaseSafe

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	zig build $zigflags
}

package() {
	cd "$srcdir/$_pkgname"
	DESTDIR="$pkgdir" zig build $zigflags install
	install -D -m644 LICENSES/GPL-3.0-only.txt "$pkgdir/usr/share/licenses/$pkgname/GPL-3.0-only.txt"
	install -D -m644 LICENSES/CC-BY-4.0.txt "$pkgdir/usr/share/licenses/$pkgname/CC-BY-4.0.txt"
	install -D -m644 LICENSES/CC0-1.0.txt "$pkgdir/usr/share/licenses/$pkgname/CC0-1.0.txt"
	install -D -m644 examples/config.kdl "$pkgdir/usr/share/doc/$pkgname/examples/config.kdl"
	cd "$srcdir"
	install -D -m644 beansprout.desktop "$pkgdir/usr/share/wayland-sessions/beansprout.desktop"
}
