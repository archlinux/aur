# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=blog
pkgauthor=kantord
pkgname=blogtato
_cratename=${pkgname}
pkgver=0.1.24
_version=${pkgver}
pkgrel=1
pkgdesc="A CLI RSS/Atom feed reader inspired by Taskwarrior"

arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('Apache-2.0' 'MIT')

depends=('glibc' 'libgcc' 'libgit2' 'openssl' 'jq')
makedepends=('cargo')

provides=("${_appname}")

source=("${_cratename}-${_version}.crate::https://crates.io/api/v1/crates/${_cratename}/${_version}/download")
sha256sums=('1a09c2ebf02a25ff9ddeea77e5e48fe6f9646f44dbc8e0e4045b5b5f113feb34')

prepare() {
	cd "${_cratename}-${_version}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${_cratename}-${_version}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd "${_cratename}-${_version}"

	./target/release/${_appname} --help
}

package() {
	cd "${_cratename}-${_version}"

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
