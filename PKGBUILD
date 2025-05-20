# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="rtthost"
_cratever="0.28.0"
pkgname="rtthost"
pkgver=0.28.0
pkgrel=1
pkgdesc='RTT (Real-Time Transfer) client'
url='https://crates.io/crates/rtthost'
license=('MIT')

depends=('gcc-libs' 'systemd-libs')
makedepends=('cargo' 'cargo-auditable')
optdepends=('probe-rs: Other probe-rs binaries')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/rtthost/0.28.0/download")
sha512sums=('c2dbe5425e22d467aebbd57e14be45b852205450e1d9f875e78da766857507353401de993836d0a272bc66c0e836362902ea5349fe902b14b87957f00709b65d')

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
