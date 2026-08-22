# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contribute: Patrick Stewart <patstew@gmail.com>

_pkgauthor=bencherdev
_pkgname=bencher
_execname=${_pkgname}

pkgname=${_pkgname}-cli
pkgver=0.6.12
pkgrel=1
_pkgver=v${pkgver}
pkgdesc="Detect and prevent performance regressions before they make it to production with continuous benchmarking"

url="https://github.com/${_pkgauthor}/${pkgname}"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')

provides=("${_execname}")

makedepends=('cargo')
depends=('glibc' 'libgcc')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${_pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('5534ca6a58fef3a30fd3bbc6551010488456ffe4e519e8bdb0e1b109f9ec1110')

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}/ || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu" --manifest-path "services/cli/Cargo.toml"
}

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}/ || exit 1

	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	CFLAGS+=" -ffat-lto-objects" RUSTFLAGS+=" --remap-path-prefix=$(pwd)=/build/" cargo build --locked --release --manifest-path "services/cli/Cargo.toml"
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}/ || exit 1

	install -Dm755 "target/release/${_execname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
