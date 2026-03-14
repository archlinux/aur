# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=blog
pkgauthor=kantord
pkgname=blogtato
pkgver=0.1.18
_version=v${pkgver}
pkgrel=1
pkgdesc="A CLI RSS/Atom feed reader inspired by Taskwarrior"

arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('Apache-2.0' 'MIT')

depends=('glibc' 'libgcc' 'libgit2' 'openssl')
provides=("${_appname}")
makedepends=('cargo')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${_version}.tar.gz")
sha256sums=('322fabfa83716b563fd72fa94f9d504db0c57616ccf7496e92a0d540da529711')

prepare() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd "${pkgname}-${pkgver}"

	./target/release/${_appname} --help
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
