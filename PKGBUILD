pkgname=snib-git
pkgver=r2.c1a6473
pkgrel=1
pkgdesc='Thumbnail window/display picker for Wayland screen sharing (xdg-desktop-portal-wlr)'
arch=('x86_64' 'aarch64')
url='https://github.com/zelane/snib'
license=('GPL-3.0-or-later')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('cargo' 'git')
provides=('snib')
conflicts=('snib')
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "${pkgname}"
	install -Dm0755 -t "$pkgdir/usr/bin/" 'target/release/snib'
	install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}/" 'LICENSE'
}
