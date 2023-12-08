# Maintainer: printfn <printfn@users.noreply.github.com>

pkgname=fend
pkgver=1.3.3
pkgrel=1
epoch=
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64')
url="https://github.com/printfn/fend"
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('cargo' 'pandoc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/printfn/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=("90364fab29b51e1c359ff72f8ccfc3e8a3c96bbc8b38d0646c28c489a8071084")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --package fend
	./documentation/build.sh
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features --package fend --package fend-core -- -q
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 documentation/fend.1 -t "${pkgdir}/usr/share/man/man1"
}

