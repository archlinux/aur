# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="vlasky"
pkgname="klyv"
pkgver=0.5.0
pkgrel=1
pkgdesc="Redis-compatible embedded key-value store backed by SQLite"

license=('GPL-3.0-or-later')
arch=('x86_64')

_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${pkgname}")

makedepends=('cargo')
depends=('glibc' 'libgcc')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c0c7313b7435b61cee01c4c197b88bd1185048d644955ca4fd97c2c6b9500426')

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
	cargo test --frozen --release -- \
		--skip "differential_server_random_resp2" \
		--skip "differential_server_random_resp3" \
		--skip "differential_server_resp2" \
		--skip "differential_server_resp3"
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
