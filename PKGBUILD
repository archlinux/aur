
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: Daurnimator <daurnimator@archlinux.org>

pkgname=river-git
_pkgname=${pkgname%-*}
pkgver=r738.e6bb373
pkgrel=1
pkgdesc='A dynamic tiling wayland compositor.'
arch=('x86_64')
url='https://github.com/ifreund/river'
license=('GPL3')
depends=(
	'mesa>=21.1.2' 'wlroots>=0.14.0' 'wayland' 'wayland-protocols'
	'libxkbcommon' 'libevdev' 'pixman' 'xorg-xwayland' 'polkit'
)
makedepends=('zig>=0.8.0' 'git' 'scdoc')
provides=('river' 'riverctl' 'rivertile')
conflicts=('river' 'river-noxwayland-git')
source=(
	"git+$url"
	'git+https://github.com/ifreund/zig-pixman.git'
	'git+https://github.com/ifreund/zig-wayland.git'
	'git+https://github.com/swaywm/zig-wlroots.git'
	'git+https://github.com/ifreund/zig-xkbcommon.git'
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
	cd "$_pkgname"
	git submodule init
	for dep in pixman wayland wlroots xkbcommon; do
		git config "submodule.deps/zig-$dep.url" "$srcdir/zig-$dep"
	done
	git submodule update
}

pkgver() {
	cd "$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" zig build install -Drelease-safe -Dxwayland \
		--prefix '/usr'
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
