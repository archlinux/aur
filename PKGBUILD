# Maintainer: staszek <staszekborkowski7@gmail.com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=omacom
pkgname=ttfx
pkgver=0.5.0
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
sha256sums=('2882c7e47011a95f4d136303f7320da71613299840f67f88fd1385ef53d5f2a0')

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
