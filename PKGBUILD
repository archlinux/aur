# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=akunzai
_pkgname=gistui
_execname=${_pkgname}

pkgname=${_pkgname}
pkgver=0.24.0
pkgrel=1
_pkgver=v${pkgver}
pkgdesc="A terminal UI for managing GitHub Gists"

url="https://github.com/${_pkgauthor}/${pkgname}"
arch=('x86_64' 'aarch64')
license=('MIT')

depends=('glibc' 'libgcc')
provides=("${_execname}")
makedepends=('rust')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${_pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('c1e433784f271a9fa96ae949e7bbcc0532e17d799966ed49535f8817eaae3212')

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
	export CARGO_TERM_COLOR=always
	cargo test --release --locked -- \
		--skip "tui::dispatch::tests::a_terminal_bearing_outcome_reaching_route_outcome_trips_the_assert" \
		--nocapture 2>&1 --color always | tr -d '\000-\010\013\014\016-\032\034-\037\177'
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	install -Dm755 "target/release/${_execname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
