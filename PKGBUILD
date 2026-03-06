# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="compendium"
_cratever="0.2.0"
pkgname="compendium"
pkgver=0.2.0
pkgrel=1
pkgdesc='A user-friendly strace for x86 Linux with HTML reports'
url='https://crates.io/crates/compendium'
license=('MIT')

depends=('libgcc' 'libbpf')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/compendium/0.2.0/download"
        'dynamic-linking.patch')
sha512sums=('6d63001d889e3d42e095f45577b22e581548cf71cdc42ac90f755436c4a39b5da9cf222f8220dee3aeae08cdaebd9babeab14f44315d91a2a6fa4642e9f52dcc'
            '5554bf10e40e8a9698c8042ce37fc474431df07c78019f2ce2aa9e9ea04a0f48dc63120a896a7d768607286815f6a57732656ee5b6e5275dddd48e112790bf7a')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$_cratever"
	
	patch -Np0 -i "$srcdir/dynamic-linking.patch"

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
	install -Dm755 "target/release/compendium" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
