# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

pkgname="cargo-doc2readme-git"
pkgver=0.6.3.r1.g4b72257
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from your code'
license=('Apache-2.0')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

url="https://codeberg.org/msrd0/cargo-doc2readme"
depends=('gcc-libs')
makedepends=('cargo' 'cargo-auditable')
conflicts=('cargo-doc2readme')
provides=('cargo-doc2readme')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed -E 's,^([0-9\.]+)-([0-9]+)-(g[0-9a-f]+)$,\1.r\2.\3,'
}

prepare() {
	cd "$srcdir/$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"
	
	cargo auditable build --offline --locked --release
}

check() {
	cd "$srcdir/$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo test --offline --locked --release
}

package() {
	cd "$srcdir/$pkgname"
	
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
}
