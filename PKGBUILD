# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-doc2readme"
pkgname="cargo-doc2readme"
pkgver=0.1.3
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from...'
url='https://crates.io/crates/cargo-doc2readme'
license=('Apache')

depends=('gcc-libs' 'curl' 'libgit2.so=1.4')
makedepends=('cargo' 'libgit2')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-doc2readme/0.1.3/download")
sha512sums=('0880d2418bc66609764ef85be63d3df6237ff1ec1afff6d6715ba4cbf048748a0abfdb8f040f745f610f998c7c163ebfbc02d2b1b6988fdaca73d091c2618558')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	cargo fetch --locked
}

build() {
	cd "$srcdir/$_crate-$pkgver"
	LIBSSH2_SYS_USE_PKG_CONFIG='1' \
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
}