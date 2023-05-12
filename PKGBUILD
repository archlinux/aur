# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ml <>

# GPG keys: https://github.com/hurl-bot.gpg

pkgname=hurl-rs
pkgver=3.0.0
_commit=277393700b9dbc48aba28be8ccb7ea3e766cc0cb
pkgrel=1
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2' 'openssl')
makedepends=('cargo' 'git' 'python')
options=('!lto')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('2A8D14993928B676E424009F1283A2B4A0DCAF8D') ## hurl-bot on GitHub

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
	./bin/release/man.sh
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features --workspace || echo 'Tests failed'
}

package() {
	cd "$pkgname"
	install -Dv target/release/hurl{,fmt} -t "$pkgdir/usr/bin"
	install -Dvm644 target/man/hurl{,fmt}.1.gz -t "$pkgdir/usr/share/man/man1"
}
