# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="cargo-all-features"
_cratever="1.12.0"
pkgname="cargo-all-features"
pkgver=1.12.0
pkgrel=1
pkgdesc='A Cargo subcommand to build and test all feature flag combinations'
url='https://crates.io/crates/cargo-all-features'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs' 'cargo')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/cargo-all-features/1.12.0/download")
sha512sums=('0ae2ca5e5fd3e1dafd6a326a9fcfeb4c19c5277a0ab80cc394e0b5c8f76cb379d9060e1112d8adedb81b958ba44d259067f42f507313e78cf3768191cc138ec9')

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
