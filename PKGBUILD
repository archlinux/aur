# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="cargo-all-features"
_cratever="1.11.0"
pkgname="cargo-all-features"
pkgver=1.11.0
pkgrel=1
pkgdesc='A Cargo subcommand to build and test all feature flag combinations'
url='https://crates.io/crates/cargo-all-features'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'cargo')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/cargo-all-features/1.11.0/download")
sha512sums=('3a9da1903d244126b6e58c18df1a862833fe50c27be888698110ec34f23eca447fc95d0f572c9f4ddad5028b71c31d1c70bf48dc672b7416a3753b60e7858f05')

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
	_check --lib
	_check --tests
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/cargo-all-features" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-build-all-features" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-check-all-features" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-test-all-features" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
