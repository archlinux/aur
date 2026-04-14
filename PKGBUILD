# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=things3-cloud
pkgver=0.8.0
pkgrel=1
pkgdesc="Command-line client for Things 3 using the Things Cloud API"
arch=('x86_64' 'aarch64')
url="https://github.com/evanpurkhiser/things3-cloud"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
conflicts=('things3-cloud-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanpurkhiser/things3-cloud/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9e63eb7f724028be5c31aa7765693fd1664810ecab488cbc1b47b453500c986f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 target/release/things3 "${pkgdir}/usr/bin/things3"
	install -Dm644 <("${pkgdir}/usr/bin/things3" completions bash) \
		"${pkgdir}/usr/share/bash-completion/completions/things3"
	install -Dm644 <("${pkgdir}/usr/bin/things3" completions zsh) \
		"${pkgdir}/usr/share/zsh/site-functions/_things3"
	install -Dm644 <("${pkgdir}/usr/bin/things3" completions fish) \
		"${pkgdir}/usr/share/fish/vendor_completions.d/things3.fish"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
