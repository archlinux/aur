# Maintainer: Peter Grayson <pete@jpgrayson.net>
# Contributor: Terin Stock <terinjokes@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=stgit
pkgver=2.1.0
pkgrel=1
pkgdesc="Pushing/popping patches to/from a stack on top of Git, similar to Quilt"
url="https://stacked-git.github.io/"
license=('GPL2')
arch=(x86_64)
depends=('git' 'libgit2' 'curl' 'bzip2')
makedepends=('cargo' 'asciidoc' 'xmlto')
source=(
	"https://github.com/stacked-git/stgit/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('eddda48bc94c7bc4c84a40506f575c34cb574f0d088eb105e1732c1c06b7ee2d')

prepare() {
	cd "${pkgname}-${pkgver}"
	cargo --locked fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=${PWD}/target
	make build doc
	make -C completion all
}

check() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=${PWD}/target
	make unit-test
}

package() {
	cd "${pkgname}-${pkgver}"
	make prefix=/usr DESTDIR=${pkgdir} install-all
	install -D -m 0644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
