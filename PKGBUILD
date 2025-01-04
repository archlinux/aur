# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="crab-hole"
_cratever="0.1.11"
pkgname="crab-hole"
pkgver=0.1.11
pkgrel=1
pkgdesc='Pi-Hole clone written in rust using hickory-dns/trust-dns'
url='https://crates.io/crates/crab-hole'
license=('AGPL-3.0-or-later')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/crab-hole/0.1.11/download"
		'crab-hole.service')
sha512sums=('22c9e59a61f47230f1b8cac5ceca5084c162d7a3af7a12698985710eea2d047245a7fb515493ad8704301d570b093dc42d9a175c1156b1a8ce85281d79fc77b6'
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

	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/crab-hole" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/crab-hole.service" -t "$pkgdir//usr/lib/systemd/system/"
}