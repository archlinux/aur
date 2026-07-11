# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

gitauthor=Vitruves
gitname=firemark
appname=${gitname}
pkgname=${appname}
pkgver=0.1.4
gitversion=v${pkgver}
pkgrel=1
pkgdesc="A fast, single-binary watermarking tool for images and PDFs"

arch=('x86_64' 'aarch64')
license=('MIT')

giturl="https://github.com/${gitauthor}/${gitname}"
giturlraw="https://raw.githubusercontent.com/${gitauthor}/${gitname}/${gitversion}"
url=${giturl}

provides=("${appname}")

makedepends=('cargo')
depends=('glibc' 'libgcc')

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${gitversion}.tar.gz")
sha256sums=('a0058a118664fd1348b4ab7c12e8cfb55802a8f142e1abfab925f6bcf0eb2a87')

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

	./target/release/${appname} -V

	# ./tests/generate_examples.sh
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 "target/release/${appname}" "${pkgdir}/usr/bin/${appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
