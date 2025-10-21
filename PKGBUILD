# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="crab-hole"
_cratever="0.1.12"
pkgname="crab-hole"
pkgver=0.1.12
pkgrel=1
pkgdesc='Pi-Hole clone written in rust using hickory-dns/trust-dns'
url='https://crates.io/crates/crab-hole'
license=('AGPL-3.0-or-later')

depends=('gcc-libs')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/crab-hole/0.1.12/download"
        'crab-hole.service')
sha512sums=('249f5e4dfb25ffa4776e2bc859acd3a5cba7715e495afa965cb4413c58dae1ae91895800bd9ad634b046ca3ac95be967411e96acd9a73bf946c8a85c7b0a4235'
            "0cb8a1137c3adab1553db7bae431b69fdd653f2025a106b04122100279bac6c7b27f038af436203fa7726ec0e744a46795c7f0baf32a53e03f363eb2e604c327")

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

_check() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo test \
		--frozen \
		--release \
		"${@}"
}

check() {
	_check --bins
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/crab-hole" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/crab-hole.service" -t "$pkgdir//usr/lib/systemd/system/"
}