# Maintainer: staszek <staszekborkowski7@gmail.com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=omacom
pkgname=ttfx
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal text effects as a single static binary"

arch=('x86_64')
license=('MIT')
url="https://github.com/${pkgauthor}/${pkgname}"

provides=("${pkgname}")

makedepends=('cargo')
depends=('glibc' 'libgcc')

options=('!lto')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('90a057971973917a45ae1cb2fc795cfaea33afc265180ba4a963172daf9f64ee')

prepare() {
	cd "${pkgname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release

	mkdir -p completions
	./"target/release/${pkgname}" --print-completion zsh > "completions/${pkgname}.zsh"
	./"target/release/${pkgname}" --print-completion bash > "completions/${pkgname}.bash"
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "completions/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
	install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
