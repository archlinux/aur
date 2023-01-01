# Maintainer: Peter Grayson <pete@jpgrayson.net>
# Contributor: Terin Stock <terinjokes@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=stgit-git
_pkgname=stgit
pkgver=r2722.8ba765f6
pkgrel=1
pkgdesc="Pushing/popping patches to/from a stack on top of Git, similar to Quilt"
url="https://stacked-git.github.io/"
license=('GPL2')
arch=(x86_64)
depends=('git' 'curl' 'bzip2')
makedepends=('cargo' 'asciidoc' 'xmlto')
conflicts=('stgit')
source=("${_pkgname}::git+https://github.com/stacked-git/stgit.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	cargo --locked fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=${PWD}/target
	make build doc
	make -C completion all
}

check() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=${PWD}/target
	make unit-test
}

package() {
	cd "${_pkgname}"
	make prefix=/usr DESTDIR=${pkgdir} install-all
	install -D -m 0644 "COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}

