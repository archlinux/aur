#!/hint/bash
# Maintainer: Marek 'seqre' Grzelak <aur@seqre.dev>

pkgname='baca-cli'
pkgver='v0.5.0'
pkgrel=1
pkgdesc="CLI client for the Jagiellonian University's BaCa online judge"
arch=('x86_64')
url="https://github.com/hjaremko/baca-cli"
license=('MIT')
depends=('bzip2' 'openssl')
makedepends=('git' 'rust' 'cargo')
checkdepends=('rust' 'cargo')
provides=('baca')
source=("git+https://github.com/hjaremko/${pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')

_binaryname='baca'

pkgver() {
	cd "${pkgname}"
	git describe --abbrev=0 --tags
}

prepare() {
	cd "${pkgname}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}"
	RUSTUP_TOOLCHAIN=stable cargo build --release --frozen --all-features --target-dir=target
}

check() {
	cd "${pkgname}"
	RUSTUP_TOOLCHAIN=stable cargo test --release --frozen --all-features --target-dir=target
}

package() {
	cd "${pkgname}"
	install -Dm 755 target/release/${_binaryname} -t "${pkgdir}/usr/bin"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
