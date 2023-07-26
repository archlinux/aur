# Maintainer: fabillo <fabillo@archlinux.org>
pkgname="ripdrag-git"
pkgver=0.3.2.r0.d162e52
pkgrel=1
pkgdesc="Drag and drop files to and from the terminal"
arch=(x86_64)
url="https://github.com/nik012003/ripdrag"
license=('GPL3')
depends=('gtk4')
makedepends=('cargo')
provides=('ripdrag')
conflicts=('ripdrag')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd "$pkgname"
	./target/release/ripdrag -V
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/ripdrag" "$pkgdir/usr/bin/ripdrag"
}
