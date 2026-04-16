# shellcheck disable=all
# Maintainer: Walter - "Y29udGFjdG9Ad2FsdGVyY2FzYW5vdmEudGVjaAo="
# Maintainer: Guillermo Galavis <druxorey@proton.me>

pkgname=tetro-tui
pkgver=3.0.0
pkgrel=3
pkgdesc="A terminal-based but modern tetromino-stacking game that is very customizable and cross-platform. "
arch=('x86_64' 'aarch64')
url="https://github.com/Strophox/tetro-tui"
license=('MIT')
depends=()
makedepends=('rust')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('d9ff1c6968b044d6ff20bf6b91c7afabd7d7e52b0d6a25fdb3f8d6e9112c85ae9e26ba5ff8d9a863dde690520321f9784e2be3543541e1cad9b4cf38b984c987')
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
