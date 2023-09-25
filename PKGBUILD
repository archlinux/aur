# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ml <>

pkgname=hurl-rs
pkgver=4.1.0
_commit="b12b761921dd78f2d096c741fb54a2c0362bc179"  # git rev-list -n1 ${pkgver}
pkgrel=1
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2' 'openssl')
makedepends=('cargo' 'git')
checkdepends=('cargo')
conflicts=('hurl' 'hurl-bin')
options=('!lto')
changelog=CHANGELOG.md
source=("${pkgname}::git+${url}#commit=${_commit}?signed")
sha256sums=('SKIP')
validpgpkeys=('2A8D14993928B676E424009F1283A2B4A0DCAF8D') # hurl-bot <bot@hurl.dev> : https://github.com/hurl-bot.gpg

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
}

check() {
	cd "$pkgname"

	[[ "$(target/release/hurl -V)" = "hurl ${pkgver} "* ]]

	export RUSTUP_TOOLCHAIN=stable
	cargo test --lib --frozen --all-features --workspace
}

package() {
	set -x
	cd "$pkgname"
	install -Dv target/release/hurl{,fmt} -t "$pkgdir/usr/bin"
	install -d "${pkgdir}/usr/share/man/man1"
	gzip -9c docs/manual/hurl.1 > "${pkgdir}/usr/share/man/man1/hurl.1.gz"
	gzip -9c docs/manual/hurlfmt.1 > "${pkgdir}/usr/share/man/man1/hurlfmt.1.gz"
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	cp -av -t "${pkgdir}/usr/share/doc/${pkgname}" docs/*
}
