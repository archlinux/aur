# Maintainer: gegnep <96670443+gegnep@users.noreply.github.com>
pkgname=regionlock
pkgver=1.0.0
pkgrel=1
pkgdesc='Linux CLI server picker for Steam Datagram Relay games (Deadlock, CS2, Dota 2)'
arch=('x86_64')
url='https://github.com/gegnep/regionlock'
license=('GPL-3.0-only')
depends=('nftables' 'systemd' 'iputils' 'polkit')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Replace with the real checksum: `updpkgsums` or `makepkg -g`.
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --release --workspace
}

package() {
	cd "$pkgname-$pkgver"
	# The Makefile install phase does not rebuild; it stages the binaries
	# built above and rewrites the polkit path to /usr/bin.
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
