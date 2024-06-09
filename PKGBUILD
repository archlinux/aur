# Maintainer: Lili1228 <aur at lili dot lgbt>
pkgname=martypc
pkgver=0.2.1
pkgrel=1
pkgdesc='An IBM PC/XT emulator written in Rust'
arch=(x86_64 aarch64)
depends=(alsa-lib libudev.so # explicit
gcc-libs glibc) # implicit
makedepends=(cargo git)
url="https://github.com/dbalsom/${pkgname}"
license=(MIT)
install=martypc.install
#source=("git+https://github.com/dbalsom/martypc.git#branch=version_$(printf $pkgver | tr '\.' '_')")
source=("${pkgname}-${pkgver}.tgz::https://github.com/dbalsom/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('461cd74c4d5ce63301d701c13322552c9673bee76184f7c821cb245e2e49c469cdb24c1b6dfbdd494acef793d1e628b7b821fecaedcf5126e6607884cb66f1ad')

prepare() {
	cd ${pkgname}
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${pkgname}
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

#check() {
#	cd ${pkgname}
#	export RUSTUP_TOOLCHAIN=stable
#	cargo test --frozen --release
#}

package() {
	cd ${pkgname}
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
	cp -a --no-preserve=ownership install "$pkgdir/usr/share/martypc"
}
