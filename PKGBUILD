# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=orhun
pkgname=cargo-tree-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="Display an interactive tree visualization of your Rust dependency graph"

arch=('x86_64')
license=('Apache-2.0' 'MIT')
url="https://github.com/${pkgauthor}/${pkgname}"

provides=("${pkgname}")

makedepends=('cargo')
depends=('glibc' 'libgcc' 'openssl' 'libgit2' 'curl')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1b24cbcbd2d0ed03194993f82c3ac09c5caf7e19c79ae89a5044729b0ab69a08')

prepare() {
	cd "${pkgname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
