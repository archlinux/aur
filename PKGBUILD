# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=zork++
pkgver=0.5.0
pkgrel=1
pkgdesc="A modern C++ project manager and build system for modern C++"
arch=('x86_64')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('zork++')
conflicts=('zork++')
source=(
	"$pkgname-$pkgver-src.zip::https://github.com/zerodaycode/Zork/archive/refs/tags/v${pkgver}.zip"
)
sha256sums=(
	'eebf301720a943c0240afefad2167f9db4c97076b0464139d6e8085660e524b3'
)

prepare() {
	pushd "${srcdir}/Zork-${pkgver}/${pkgname}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	popd
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	pushd "${srcdir}/Zork-${pkgver}/${pkgname}"
	cargo build --frozen --release --all-features
	popd
}

check() {
	export RUSTUP_TOOLCHAIN=stable

	pushd "${srcdir}/Zork-${pkgver}/${pkgname}"
	# Integration tests would need clang and gcc, so we skip them
	cargo test --release --frozen --all-features --bins
	cargo test --release --frozen --all-features --lib
	cargo test --release --frozen --all-features --doc
	popd
}

package() {
	install -Dm644 "${srcdir}/Zork-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/Zork-${pkgver}/${pkgname}/target/release/zork" \
		"${pkgdir}/usr/bin/zork++"
}
