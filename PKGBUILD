# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=akunzai
_pkgname=duodiff
_execname=${_pkgname}

pkgname=${_pkgname}
pkgver=0.11.0
pkgrel=1
_pkgver=v${pkgver}
pkgdesc="A cross-platform TUI directory comparison tool"

url="https://github.com/${_pkgauthor}/${pkgname}"
arch=('x86_64' 'aarch64')
license=('MIT')

depends=('glibc' 'libgcc')
provides=("${_execname}")
makedepends=('rust')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${_pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('281063dd7670f831782b8bced8249a3012b7da8bb51ed1b00dc1fde4018e4df2')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects" RUSTFLAGS+=" --remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	export CARGO_TARGET_DIR=target
	cargo test --release --locked -- \
		--skip "tui::dispatch::tests::a_terminal_bearing_outcome_reaching_route_outcome_trips_the_assert"
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	install -Dm755 "target/release/${_execname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
