# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-doc2readme"
pkgname="$_crate"
pkgver=0.1.2
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from...'
url='https://crates.io/crates/cargo-doc2readme'
license=('Apache')

depends=('gcc-libs' 'curl' 'libgit2.so=1.4')
makedepends=('cargo' 'libgit2')

source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('7fdc0537378a2b6e5a243e4c06aac7b52ce2c4e0a1f50175d2c0e5e9388a2c0944cb5f0ae62f6018ff9be137f6ef88546760b8d391081dfa72886416f36d0b9e')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo fetch --locked
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	LIBSSH2_SYS_USE_PKG_CONFIG='1' \
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
}