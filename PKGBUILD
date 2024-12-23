# Maintainer: Kimiblock Moe

pkgname=clash-rs-git
pkgdesc="custom protocol network proxy"
url="https://github.com/Watfaq/clash-rs"
license=("Apache-2.0")
arch=("any")
pkgver=latest.r0.gc69339e6
pkgrel=1
makedepends=("cargo-nightly" "git")
depends=("gcc-libs" "glibc" "xz" "protobuf")
source=("git+https://github.com/Watfaq/clash-rs.git")
md5sums=("SKIP")
provides=("clash-rs")
conflicts=("clash-rs")
options=(!lto)

function pkgver() {
	cd "${srcdir}/clash-rs"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare() {
	cd "${srcdir}/clash-rs"
	#export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

function build() {
	cd "${srcdir}/clash-rs"
	#export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features --locked
}

function package() {
	install -Dm755 "${srcdir}/clash-rs/target/release/clash-rs" "${pkgdir}/usr/bin/clash-rs"
	install -Dm644 "${srcdir}/clash-rs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

