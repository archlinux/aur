# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=emilien-jegou
_pkgname=oyui
_execname=${_pkgname}

pkgname=${_pkgname}
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern TUI merge tool and interactive diff editor for Jujutsu (jj) and Git"

url="https://github.com/${_pkgauthor}/${pkgname}"
arch=('x86_64' 'aarch64')
license=('GPL-3.0')

depends=('glibc' 'libgcc')
provides=("${_execname}")
makedepends=('rust')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91f8b31e83dac218d970f8b646a5558258e5ff494f5cae969dcdfa74a3989608')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo update --precise "${pkgver}" --package "${pkgname}"
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects" RUSTFLAGS+=" --remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	install -Dm755 "target/release/${_execname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/themes.md" "${pkgdir}/usr/share/doc/${pkgname}/THEMES.md"
}
