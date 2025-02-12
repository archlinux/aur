# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="rtthost"
_cratever="0.27.0"
pkgname="rtthost"
pkgver=0.27.0
pkgrel=1
pkgdesc='RTT (Real-Time Transfer) client'
url='https://crates.io/crates/rtthost'
license=('MIT')

depends=('gcc-libs' 'systemd-libs')
makedepends=('cargo' 'cargo-auditable')
optdepends=('probe-rs: Other probe-rs binaries')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/rtthost/0.27.0/download")
sha512sums=('bf58d8f19289a2f1a5fb072f1947d908d4a909e4aeee0a65fc2166ac1ac68a17b24b7c5dcbd91e9d6a832db64b9977198140fc41da3ca15e1b5454d76ca1ec2b')

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