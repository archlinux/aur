
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: Daurnimator <daurnimator@archlinux.org>

pkgname=river-noxwayland-git
_pkgname=river
pkgver=0.1.0.r7.g93afdb3
pkgrel=2
pkgdesc='A dynamic tiling wayland compositor.'
arch=('x86_64')
url='https://github.com/riverwm/river'
license=('GPL3')
depends=(
	'mesa' 'wlroots' 'wayland' 'wayland-protocols' 'libxkbcommon'
	'libevdev' 'pixman' 'polkit'
)
makedepends=('zig' 'git' 'scdoc')
provides=('river' 'riverctl' 'rivertile')
conflicts=('river' 'river-bin' 'river-git')
source=(
	"git+$url"
	'git+https://github.com/ifreund/zig-pixman.git'
	'git+https://github.com/ifreund/zig-wayland.git'
	'git+https://github.com/swaywm/zig-wlroots.git'
	'git+https://github.com/ifreund/zig-xkbcommon.git'
	'river.desktop'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'6ccc55e95666904cbdeeeeed841a16f728cbae2609646130a4c53785e588e4b0'
)

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule init
	for dep in pixman wayland wlroots xkbcommon; do
		git config "submodule.deps/zig-$dep.url" "$srcdir/zig-$dep"
	done
	git submodule update
}

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$srcdir/$_pkgname"
	DESTDIR="$pkgdir" zig build install -Drelease-safe --prefix '/usr'
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"

	cd "$srcdir"
	install -Dm644 river.desktop -t "$pkgdir/usr/share/wayland-sessions"
}
