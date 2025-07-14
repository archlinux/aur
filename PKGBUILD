# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="rtthost"
_cratever="0.29.1"
pkgname="rtthost"
pkgver=0.29.1
pkgrel=1
pkgdesc='RTT (Real-Time Transfer) client'
url='https://crates.io/crates/rtthost'
license=('MIT')

depends=('gcc-libs' 'systemd-libs')
makedepends=('cargo' 'cargo-auditable')
optdepends=('probe-rs: Other probe-rs binaries')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/rtthost/0.29.1/download")
sha512sums=('1d3087fd74fd02a47c1e78504f0928425950fef408c85d51260d9a9881e9f400a6b88896abd91103601f5f40096e93f7e8a12772830b1c3c062246b58e7b5af9')

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
