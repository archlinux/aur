# Maintainer: Lili1228 <aur at lili dot lgbt>
pkgname=martypc
pkgver=0.2.0
pkgrel=1
pkgdesc='An IBM PC/XT emulator written in Rust'
arch=(x86_64 aarch64)
depends=(alsa-lib libudev.so # explicit
gcc-libs glibc) # implicit
makedepends=(cargo)
url="https://github.com/dbalsom/${pkgname}"
license=(MIT)
install=martypc.install
source=("${pkgname}-${pkgver}.tgz::https://github.com/dbalsom/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('b3323da56f3ddead7ff1e8630ca85a6d904200032797f9a4f48ee0bb6f89838c26e9ea693e40e3f0e40979a7792cb4bfb0d2f26b9667fa8fdf09a8dbac8c6ece')

prepare() {
	cd ${pkgname}-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${pkgname}-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

#check() {
#	cd ${pkgname}-${pkgver}
#	export RUSTUP_TOOLCHAIN=stable
#	cargo test --frozen --release
#}

package() {
	cd ${pkgname}-${pkgver}
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
	cp -a --no-preserve=ownership install "$pkgdir/usr/share/martypc"
}
