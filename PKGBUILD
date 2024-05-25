# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="rtthost"
pkgname="rtthost"
pkgver=0.24.0
pkgrel=1
pkgdesc='RTT (Real-Time Transfer) client'
url='https://crates.io/crates/rtthost'
license=('MIT')

depends=('gcc-libs' 'systemd-libs')
makedepends=('cargo')
optdepends=('probe-rs: Other probe-rs binaries')

source=("$_crate-0.24.0.tar.gz::https://crates.io/api/v1/crates/rtthost/0.24.0/download")
sha512sums=('582d6e2ab2be759f89d6ca77e7211fa12d91da04ddc90002e0b43faa9bd5b7908c2a865d274abb8332e11032f1a830072da8f3562099fb6818cbcd34445fb06b')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.24.0"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-0.24.0"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-0.24.0"
	install -Dm755 "target/release/rtthost" -t "$pkgdir/usr/bin"
}