# Maintainer: Lina Roether <lina.roether@proton.me>

pkgname=niji-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A customizable tool for theming linux systems"
url="https://github.com/lina-roether/niji"
arch=("x86_64" "i686" "arm" "armv6h" "armv7h" "aarch64")
license=("GPL-3.0")
makedepends=("cargo" "git")
provides=("niji")
conflicts=("niji")
source=("git+${url}.git")
md5sums=("SKIP")

pkgver() {
	cd niji
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd niji
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd niji
	export RUST_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd niji

	# Install binary
	install -Dm755 target/release/niji -t "$pkgdir/usr/bin"

	# Install modules and themes
	mkdir -p "$pkgdir/usr/share/niji"
	cp -a assets/modules "$pkgdir/usr/share/niji/"
	cp -a assets/themes "$pkgdir/usr/share/niji/"
}
