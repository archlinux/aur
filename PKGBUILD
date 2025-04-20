# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-clean-all"
_cratever="0.6.4"
pkgname="cargo-clean-all"
pkgver=0.6.4
pkgrel=1
pkgdesc='Recursively clean all cargo projects in a given directory that match the spec...'
url='https://github.com/dnlmlr/cargo-clean-all'
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/cargo-clean-all/0.6.4/download")
sha512sums=('6b2c7fbeb85d70f41914bd40f05f3b3626a20fed2c7fa44e5c036ec63ab122383844484b5f54228c4b41508487eaa800917d864a920c02481fa7dc930c121ed6')

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
	install -Dm755 "target/release/cargo-clean-all" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
