# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=secret-stripper
pkgver=1.5.0
pkgrel=1
pkgdesc="Detect and strip secrets from text, files and clipboard, with optional screenshot OCR"
arch=('x86_64' 'aarch64')
url="https://github.com/kalix127/secret-stripper"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('tesseract: OCR of screenshots' 'tesseract-data-eng: English language data for OCR')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1229e78775e4b4a2a5ccf75727ef8e55e894b94cac4224f6ca59d2f4b5089f0d')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --bin secret-stripper
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
