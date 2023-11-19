# Maintainer: Kimiblock Moe
pkgname=clash2sing-box-git
pkgdesc="Simple tool for converting clash client outbounds to sing-box format "
url="https://github.com/oluceps/clash2sing-box"
license=(GPL3)
arch=("any")
pkgver=r242.19435af
pkgrel=1
makedepends=("rust" "cargo" "git")
depends=()
source=("git+https://github.com/oluceps/clash2sing-box.git")
md5sums=("SKIP")
provides=("clash2sing-box")

function pkgver() {
	cd "${srcdir}/clash2sing-box"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function prepare() {
	cd "${srcdir}/clash2sing-box/ctos"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

function build() {
	cd "${srcdir}/clash2sing-box/ctos"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

function check() {
	cd "${srcdir}/clash2sing-box/ctos"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

function package() {
	install -Dm755 "${srcdir}/clash2sing-box/ctos/target/release/ctos" "${pkgdir}/usr/bin/ctos"
}
