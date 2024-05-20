# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
pkgname=wprs-git
pkgver=r34.64c01e1
pkgrel=1
pkgdesc="Like xpra, but for Wayland, and written in Rust."
arch=(x86_64)
url="https://github.com/wayland-transpositor/wprs"
license=('Apache-2.0')
depends=(libxkbcommon python-psutil)
makedepends=(cargo git)
provides=("wprs")
conflicts=("wprs")
source=('wprs::git+https://github.com/wayland-transpositor/wprs.git')
sha256sums=('SKIP')
options=(!lto)

pkgver() {
	cd "$srcdir/wprs"

# Git, tags available
#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/wprs"
	cargo build --profile=release-lto
}

package() {
	cd "$srcdir/wprs"
	install -Dm755 wprs "$pkgdir/usr/bin/wprs"
	install -Dm755 target/release-lto/wprsc "$pkgdir/usr/bin/wprsc"
	install -Dm755 target/release-lto/wprsd "$pkgdir/usr/bin/wprsd"
	install -Dm755 target/release-lto/xwayland-xdg-shell "$pkgdir/usr/bin/xwayland-xdg-shell"
	install -Dm644 wprsd.service "$pkgdir/usr/lib/systemd/user/wprsd.service"
}
