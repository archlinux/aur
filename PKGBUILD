# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ml <>

pkgname=hurl-rs
pkgver=4.2.0
_commit="b8e224599a6fe2b8a1919c1b196807e7e34d0f63"  # git rev-list -n1 ${pkgver}
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
validpgpkeys=(
	'2A8D14993928B676E424009F1283A2B4A0DCAF8D' # hurl-bot <bot@hurl.dev> : https://github.com/hurl-bot.gpg
	'533460762F6401629670C6F307FF11CFD55356CC' # jcamiel <jeanchristophe.amiel@orange.com> : https://github.com/jcamiel.gpg
)

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
	cd "$pkgname"
	install -Dv target/release/hurl{,fmt} -t "$pkgdir/usr/bin"
	install -d "${pkgdir}/usr/share/man/man1"
	gzip -9c docs/manual/hurl.1 > "${pkgdir}/usr/share/man/man1/hurl.1.gz"
	gzip -9c docs/manual/hurlfmt.1 > "${pkgdir}/usr/share/man/man1/hurlfmt.1.gz"
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
	cp -avt "${pkgdir}/usr/share/doc/${pkgname}" docs/*
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
