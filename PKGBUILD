# Maintainer: Peter Grayson <pete@jpgrayson.net>
# Contributor: Terin Stock <terinjokes@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=stgit
pkgver=2.4.2
pkgrel=1
pkgdesc="Stack-based patch management for Git"
url="https://stacked-git.github.io/"
license=('GPL2')
arch=(x86_64 aarch64)
depends=('git' 'curl' 'bzip2')
makedepends=('cargo' 'asciidoc' 'xmlto')
source=(
	"https://github.com/stacked-git/stgit/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('a9e65ac5cfb941fc823ae3a068f2c8d1df50a5f9a65d7e2462546d7c11e2ac42')

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
