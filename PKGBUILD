# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="lottieconv"
_cratever="0.3.1"
pkgname="lottieconv"
pkgver=0.3.1
pkgrel=2
pkgdesc='Convert lottie files to WEBP or GIF'
url='https://crates.io/crates/lottieconv'
license=('MIT')

depends=('libgcc' 'libwebp' 'rlottie')
makedepends=('cargo' 'cargo-auditable' 'clang')
conflicts=('lottie2gif' 'lottie2webp')
replaces=('lottie2gif' 'lottie2webp')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/lottieconv/0.3.1/download")
sha512sums=('5e3777171f39a82013dfcedf9cf15bb2eacec4d20fbd5097d5a4a5ac1e44d0baf2af2e3ebb15e27adec6a85bf5f4840f533c0ebc65b0e0518f4e46faffdc174f')

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
		--features 'clap,gif,webp' \
		--release
}

_check() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo test \
		--frozen \
		--features 'clap,gif,webp' \
		--release \
		"${@}"
}

check() {
	_check --bins
	_check --lib
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/lottie2gif" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/lottie2webp" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
