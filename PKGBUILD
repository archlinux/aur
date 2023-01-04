
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: Daurnimator <daurnimator@archlinux.org>

pkgname=river-noxwayland-git
_pkgname=river
pkgver=0.3.0_dev.r1.ge49db76
pkgrel=1
pkgdesc='A dynamic tiling wayland compositor.'
arch=('x86_64')
url='https://github.com/riverwm/river'
license=('GPL3')
depends=(
	'mesa' 'wlroots' 'wayland' 'wayland-protocols' 'libxkbcommon'
	'libevdev' 'pixman'
)
optdepends=(
	'polkit: access seat through systemd-logind'
)
makedepends=('zig' 'git' 'scdoc')
provides=('river' 'riverctl' 'rivertile')
conflicts=('river' 'river-bin' 'river-git')
options=('!strip')
source=(
	"git+$url"
	'git+https://github.com/ifreund/zig-pixman.git'
	'git+https://github.com/ifreund/zig-wayland.git'
	'git+https://github.com/swaywm/zig-wlroots.git'
	'git+https://github.com/ifreund/zig-xkbcommon.git'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule init
	for dep in pixman wayland wlroots xkbcommon; do
		git config "submodule.deps/zig-$dep.url" "$srcdir/zig-$dep"
	done
	git -c protocol.file.allow=always submodule update
}

pkgver() {
	local version commit_count commit_hash

	cd "$srcdir/$_pkgname"
	version=$(sed -n 's/^const version = "\(.*\)";/\1/p' build.zig | tr '-' '_')
	commit_count=$(git describe --long | cut -d- -f2)
	commit_hash=$(git describe --long | cut -d- -f3)
	printf '%s.r%s.%s\n' "$version" "$commit_count" "${commit_hash}"
}

package() {
	cd "$srcdir/$_pkgname"
	DESTDIR="$pkgdir" zig build --prefix '/usr' -Drelease-safe
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions"
	install -d "$pkgdir/usr/share/$_pkgname"
	cp -fR example "$pkgdir/usr/share/$_pkgname"
}
