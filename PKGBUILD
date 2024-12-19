# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="probe-rs-tools"
_cratever="0.25.0"
pkgname="probe-rs"
pkgver=0.25.0
pkgrel=1
pkgdesc='A collection of on chip debugging tools to communicate with microchips.'
url='https://probe.rs'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'systemd-libs')
makedepends=('cargo' 'cmake')
optdepends=('rtthost: Real-time transfer client')
conflicts=('cargo-embed' 'cargo-flash')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/probe-rs-tools/0.25.0/download"
		'69-probe-rs.rules')
sha512sums=('dd400c76319bbc7098acf5dfcec4c370b2692751d25beb14288cfe64328af2faf7b8fee0e247f5f09a0b442295b553b59ead49d7e2a99216024b40e99086a3c6'
            "bb16b7e2c1d1522bae4b457c3547337531d4ebc9f2db1f1e319c4d7ad4308da6888afa746516cb2a41349cca6114b7cf1927825936ab879b066b362197b15095")

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-$_cratever"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/cargo-embed" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-flash" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/probe-rs" -t "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/69-probe-rs.rules" -t "$pkgdir//usr/lib/udev/rules.d/"
}