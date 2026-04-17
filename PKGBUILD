# shellcheck disable=all
# Maintainer: Walter - "Y29udGFjdG9Ad2FsdGVyY2FzYW5vdmEudGVjaAo="
# Maintainer: Guillermo Galavis <druxorey@proton.me>

pkgname=tetro-tui
pkgver=3.1.0
pkgrel=4
pkgdesc="A terminal-based but modern tetromino-stacking game that is very customizable and cross-platform. "
arch=('x86_64' 'aarch64')
url="https://github.com/Strophox/tetro-tui"
license=('MIT')
depends=()
makedepends=('rust')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('a83054b92a790ab507fee8c7e62c2cd88d3fc573e49a3ee8f202479e2dd36a1fc36e24931673cb42b65873458fcb06b3b33500fb7b52b52214f2b3de372878b2')
options=('!debug')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
	[ -f LICENSE ]   && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	[ -f README.md ] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
