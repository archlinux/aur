# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: fabillo <fabillo@archlinux.org>

pkgauthor=nik012003
pkgname=ripdrag
pkgver=0.4.12
pkgrel=1
pkgdesc="Drag and drop files to and from the terminal"
arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('GPL-3.0')

depends=('glibc' 'gcc-libs' 'glib2' 'gdk-pixbuf2' 'gtk4' 'pango')
provides=("${pkgname}")
makedepends=('cargo')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ffa685c42e84558cc47d8bd5713f8a68f8cd8e313be55a111a0bc43bf1e220de')

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

	./target/release/${pkgname} -V
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
