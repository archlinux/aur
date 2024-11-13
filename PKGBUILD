# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="probe-rs-tools"
_cratever="0.24.0"
pkgname="probe-rs"
pkgver=0.24.0
pkgrel=2
pkgdesc='A collection of on chip debugging tools to communicate with microchips.'
url='https://probe.rs'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'systemd-libs')
makedepends=('cargo' 'cmake')
optdepends=('rtthost: Real-time transfer client')
conflicts=('cargo-embed' 'cargo-flash')

source=("$_crate-$_cratever.tar.gz::https://crates.io/api/v1/crates/probe-rs-tools/0.24.0/download"
		'69-probe-rs.rules')
sha512sums=('659b5b5c8d91728d192e32342206760d1441f44de622881930afdcc25d6f8a2dcf07ed336b34bf4ceb4ef4d0a497d074627a206bf9a038a134cd15598dacfec6'
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
