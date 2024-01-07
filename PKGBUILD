# Maintainer: printfn <printfn@users.noreply.github.com>

pkgname=fend
pkgver=1.4.1
pkgrel=1
epoch=
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64')
url="https://github.com/printfn/fend"
license=('GPL-3.0-or-later')
groups=()
depends=('gcc-libs' 'glibc' 'openssl')
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
sha256sums=("eb40e376e1da00055112edc583e86ac3913536b35f2f7265de55dca52319a4e4")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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

