# Maintainer: Guillaume Ausset <guillaume+arch@ausset.me>

pkgname=colgrep
pkgver=1.2.0
pkgrel=1
pkgdesc="Semantic code search powered by ColBERT"
arch=('x86_64')
url="https://github.com/lightonai/next-plaid"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo')
options=('!lto')
conflicts=('colgrep-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lightonai/next-plaid/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3bf3edcd01dc341305843ce43f3a9267a89aafbadf3369bd818e6cd7919ecbc1')

prepare() {
	cd "${srcdir}/next-plaid-${pkgver}"
	export CARGO_HOME="${srcdir}/cargo-home"
	cargo fetch --locked
}

build() {
	cd "${srcdir}/next-plaid-${pkgver}"
	export CARGO_HOME="${srcdir}/cargo-home"
	export CARGO_TARGET_DIR="${srcdir}/target"
	export CFLAGS="-march=native -mtune=native -ffile-prefix-map=${srcdir}=."
	export CXXFLAGS="-march=native -mtune=native -ffile-prefix-map=${srcdir}=."
	export CPPFLAGS=''
	export LDFLAGS=''
	export RUSTFLAGS="-C target-cpu=native --remap-path-prefix=${srcdir}=."
	unset CARGO_ENCODED_RUSTFLAGS
	cargo build --frozen --release --locked -p colgrep
}

package() {
	cd "${srcdir}/next-plaid-${pkgver}"
	install -Dm755 "${srcdir}/target/release/colgrep" "${pkgdir}/usr/bin/colgrep"
	install -Dm644 "colgrep/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}