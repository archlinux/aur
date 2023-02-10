# Maintainer: Marius Hirt <marius-hirt@web.de>
_pkgname=zork++
pkgname=zork++-git
pkgver=0.4.2.r4.g2a3da32
pkgrel=1
pkgdesc="A modern C++ project manager and build system for modern C++"
arch=('x86_64')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('zork++')
conflicts=('zork++')
source=("$_pkgname::git+https://github.com/zerodaycode/Zork")
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	pushd "${srcdir}/${_pkgname}/${_pkgname}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	popd
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	pushd "${srcdir}/${_pkgname}/${_pkgname}"
	cargo build --frozen --release --all-features
	popd
}

check() {
	export RUSTUP_TOOLCHAIN=stable

	pushd "${srcdir}/${_pkgname}/${_pkgname}"
	# Integration tests would need clang and gcc, so we skip them
	cargo test --release --frozen --all-features --bins
	cargo test --release --frozen --all-features --lib
	cargo test --release --frozen --all-features --doc
	popd
}

package() {
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}/target/release/zork" \
		"${pkgdir}/usr/bin/zork++"
}
