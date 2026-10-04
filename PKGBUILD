# Maintainer: Supernovatux <thulashitharan.d at gmail dot com>
pkgname=xdg-desktop-portal-gtk4-git
pkgver=1.5.1.r68.g8f88da6
pkgrel=1
pkgdesc="GTK4 implementation of xdg-desktop-portal"
arch=('x86_64')
url="https://github.com/JohnRTitor/xdg-desktop-portal-gtk4"
license=('LGPL-2.1-only')
depends=('xdg-desktop-portal' 'gtk4' 'glib2' 'gdk-pixbuf2' 'glibc' 'libgcc')
makedepends=('cargo' 'git' 'make')
provides=('xdg-desktop-portal-impl' 'xdg-desktop-portal-gtk4')
conflicts=('xdg-desktop-portal-gtk4')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --release --frozen
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make install DESTDIR="$pkgdir" PREFIX=/usr
}
