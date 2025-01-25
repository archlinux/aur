# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="rtthost"
_cratever="0.26.0"
pkgname="rtthost"
pkgver=0.26.0
pkgrel=1
pkgdesc='RTT (Real-Time Transfer) client'
url='https://crates.io/crates/rtthost'
license=('MIT')

depends=('gcc-libs' 'systemd-libs')
makedepends=('cargo' 'cargo-auditable')
optdepends=('probe-rs: Other probe-rs binaries')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/rtthost/0.26.0/download")
sha512sums=('c2fc79d1f6044e2764fadfdcecdc9b4d07ee8b58c8bf8d76e56158e94ca7980870728f3017f51821c68d6b7f4242b0e767fe697ccc045859a59bede0ed48690d')

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