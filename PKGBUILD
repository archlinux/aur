# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="probe-rs-tools"
_cratever="0.29.0"
pkgname="probe-rs"
pkgver=0.29.0
pkgrel=1
pkgdesc='A collection of on chip debugging tools to communicate with microchips.'
url='https://probe.rs'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'systemd-libs')
makedepends=('cargo' 'cargo-auditable' 'cmake')
optdepends=('rtthost: Real-time transfer client')
conflicts=('cargo-embed' 'cargo-flash')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/probe-rs-tools/0.29.0/download"
        '69-probe-rs.rules')
sha512sums=('284578145ce0d078b3a7bc8b9f68ce71d056f1946348531eef25a6df2393b6229c345d6bb711182f349efe749d2300cd5670d4e00d4d2ce0c52f0d300044cd02'
            'bb16b7e2c1d1522bae4b457c3547337531d4ebc9f2db1f1e319c4d7ad4308da6888afa746516cb2a41349cca6114b7cf1927825936ab879b066b362197b15095')

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

	cargo auditable build \
		--frozen \
		--release
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/cargo-embed" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-flash" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/probe-rs" -t "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/69-probe-rs.rules" -t "$pkgdir//usr/lib/udev/rules.d/"
}
