# Maintainer: Kimiblock Moe

pkgname=turnon
pkgdesc="Turn on devices in your local network"
url="https://github.com/swsnr/turnon"
license=("MPL-2.0")
arch=("x86_64" "aarch64")
pkgver=2.6.3
pkgrel=1
makedepends=("rust" "cargo" "git" "blueprint-compiler")
depends=(libadwaita gtk4 hicolor-icon-theme graphene dconf gcc-libs glib2 glibc)
source=("git+https://github.com/swsnr/turnon.git#tag=v${pkgver}")
md5sums=('50ffac4736a64f86d71a8753ecc7e559')

function prepare() {
	cd "${srcdir}/turnon"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

function build() {
	cd "${srcdir}/turnon"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	env RUST_BACKTRACE=1 SKIP_BLUEPRINT=1 cargo build --release --locked
	env RUST_BACKTRACE=1 SKIP_BLUEPRINT=1 make msgfmt
}

function check() {
	cd "${srcdir}/turnon"
	export RUSTUP_TOOLCHAIN=stable
	env RUST_BACKTRACE=1 SKIP_BLUEPRINT=1 cargo test --frozen --all-features
}

function package() {
	cd "${srcdir}/turnon"
	make DESTPREFIX="${pkgdir}/usr" install
}



