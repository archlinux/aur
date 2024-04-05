# Maintainer: Lili1228 <aur at lili dot lgbt>
pkgname=martypc
pkgver=0.2.0
pkgrel=3
pkgdesc='An IBM PC/XT emulator written in Rust'
arch=(x86_64 aarch64)
depends=(alsa-lib libudev.so # explicit
gcc-libs glibc) # implicit
makedepends=(cargo git)
url="https://github.com/dbalsom/${pkgname}"
license=(MIT)
install=martypc.install
source=(
	"git+https://github.com/dbalsom/martypc.git#branch=version_$(printf $pkgver | tr '\.' '_')"
	"config_keyboard_layout.diff"
)
#source=("${pkgname}-${pkgver}.tgz::https://github.com/dbalsom/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=(
'SKIP'
'a8823b6c266a1ee078ab8a6e0c45f896ba44bf6d84642c9d7c4dfcc3536f15e842598bb09c2232b7b2adc744107277e7f2cf45f6eff2e09c2167a7f75da38bd0'
)

prepare() {
	cd ${pkgname} #-${pkgver}
	patch -p1 < ../config_keyboard_layout.diff
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${pkgname} #-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

#check() {
#	cd ${pkgname} #-${pkgver}
#	export RUSTUP_TOOLCHAIN=stable
#	cargo test --frozen --release
#}

package() {
	cd ${pkgname} #-${pkgver}
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
	cp -a --no-preserve=ownership install "$pkgdir/usr/share/martypc"
}
