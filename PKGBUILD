# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="rtthost"
_cratever="0.25.0"
pkgname="rtthost"
pkgver=0.25.0
pkgrel=1
pkgdesc='RTT (Real-Time Transfer) client'
url='https://crates.io/crates/rtthost'
license=('MIT')

depends=('gcc-libs' 'systemd-libs')
makedepends=('cargo' 'cargo-auditable')
optdepends=('probe-rs: Other probe-rs binaries')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/rtthost/0.25.0/download")
sha512sums=('c005ca38212c2c1fd01ca977cfee4fdb24f6ddb46c36f6c74c384aff8609e36e70314b680b8798e9ac808f76fca6170028e518425bc737ecd852357045710e0a')

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
	install -Dm755 "target/release/rtthost" -t "$pkgdir/usr/bin"
}