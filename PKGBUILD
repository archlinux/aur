# Maintainer: printfn <printfn@users.noreply.github.com>

pkgname=fend
pkgver=1.1.6
pkgrel=1
epoch=
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64')
url="https://github.com/printfn/fend"
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('rust' 'pandoc')
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
sha256sums=("2bf2c1ac0716db91134b5862192a3c42d1b38612b7a3fd8ea3980fe884ae5ad7")
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

