# Maintainer: Lili1228 <aur at lili dot lgbt>
pkgname=martypc
pkgver=0.4.0
pkgrel=1
pkgdesc='An IBM PC/XT emulator written in Rust'
arch=(x86_64 aarch64)
depends=(alsa-lib bzip2 libudev.so # explicit
gcc-libs glibc) # implicit
# clang because gcc won't link ffi
# rustup because it doesn't compile with stable
makedepends=(clang rustup)
url="https://github.com/dbalsom/${pkgname}"
license=(MIT)
install=martypc.install
#source=("git+https://github.com/dbalsom/martypc.git#branch=version_$(printf $pkgver | tr '\.' '_')")
source=("${pkgname}-${pkgver}.tgz::https://github.com/dbalsom/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('40b0a6fade9518560c0a87d15169ae7564436044adcf98b3adbb865c28156325e2dd0c3f8561f33aa2fa82d2313a7e7aeb7e0128407fbdde1bf37381ab297da2')


prepare() {
	cd ${pkgname}-${pkgver}
	export RUSTUP_TOOLCHAIN=nightly
	export CC=clang
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${pkgname}-${pkgver}
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo b --frozen --profile release-lto -F use_winit,use_wgpu,sound,opl,use_gilrs,use_serialport
}

#check() {
#	cd ${pkgname}-${pkgver}
#	export RUSTUP_TOOLCHAIN=nightly
#	cargo t --frozen --profile release-lto
#}

package() {
	cd ${pkgname}-${pkgver}
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release-lto/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
	cp -a --no-preserve=ownership install "$pkgdir/usr/share/martypc"
}
