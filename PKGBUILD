# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: fabillo <fabillo@archlinux.org>

pkgauthor=nik012003
pkgname=ripdrag
pkgver=0.4.13
pkgrel=1
pkgdesc="Drag and drop files to and from the terminal"
arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('GPL-3.0')

depends=('glibc' 'gcc-libs' 'glib2' 'gdk-pixbuf2' 'gtk4' 'pango')
provides=("${pkgname}")
makedepends=('cargo')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f3d546233b8ba979f5ea4778f61267968a088e5b3b3035dd391ac9e6cc96162b')

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

	msg2 "$(./target/release/${pkgname} -V)"

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
