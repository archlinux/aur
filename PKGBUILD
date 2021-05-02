#!/hint/bash
# Maintainer: Marek 'seqre' Grzelak <aur@seqre.dev>

pkgname='baca-cli'
pkgver='v0.2.0'
pkgrel=1
pkgdesc="CLI client for the Jagiellonian University's BaCa online judge"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
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

build() {
	cd "${pkgname}"
	# TODO: Add --locked back after creator creates Cargo.lock in the repository
	RUSTUP_TOOLCHAIN=stable cargo build --release --all-features --target-dir=target
}

check() {
	cd "${pkgname}"
	RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
	cd "${pkgname}"
	install -Dm 755 target/release/${_binaryname} -t "${pkgdir}/usr/bin"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
