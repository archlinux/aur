# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=frecenfile
pkgauthor=kantord
pkgname=frecenfile
_cratename=${pkgname}
pkgver=0.4.1
_version=${pkgver}
pkgrel=1
pkgdesc="Compute frecency scores for files in a Git repository"

arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('MIT')

depends=('glibc' 'libgcc' 'libgit2' 'zlib' 'jq')
makedepends=('cargo')

provides=("${_appname}")

source=("${_cratename}-${_version}.crate::https://crates.io/api/v1/crates/${_cratename}/${_version}/download")
sha256sums=('8f25cb6d11105515e8ef7e7b09ebeb2db132a7e158bf000a563717f8836ddd82')

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

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
