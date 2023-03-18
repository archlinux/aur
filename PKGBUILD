# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=zork++
pkgver=0.8.3
pkgrel=1
pkgdesc="A modern C++ project manager and build system for modern C++"
arch=('x86_64')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
provides=('zork++')
conflicts=('zork++')
source=(
	"$pkgname-$pkgver-src.zip::https://github.com/zerodaycode/Zork/archive/refs/tags/v${pkgver}.zip"
)
sha256sums=(
	'3a7f1ec596b0309bdb3d565d55dfd5b56797792d5a788d591e9e928635a3204b'
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
