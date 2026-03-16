# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=blog
pkgauthor=kantord
pkgname=blogtato
pkgver=0.1.19
_version=v${pkgver}
pkgrel=1
pkgdesc="A CLI RSS/Atom feed reader inspired by Taskwarrior"

arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('Apache-2.0' 'MIT')

depends=('glibc' 'libgcc' 'libgit2' 'openssl')
makedepends=('cargo')
optdepends=('jq')

provides=("${_appname}")

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${_version}.tar.gz")
sha256sums=('83ccab946cc3f4e8798bb8dbaa2e7b946048d86839b2d23446dfedc79692a562')

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
