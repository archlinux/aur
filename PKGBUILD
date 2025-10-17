# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf
_pkgname=miro
pkgver=0.6.2
pkgrel=2
pkgdesc="A native pdf viewer for Windows and Linux (Wayland/X11) with configurable keybindings."
arch=('x86_64')
url="https://github.com/vincent-uden/miro"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'fontconfig')
makedepends=('cargo' 'clang')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5d48de21730209b88b9d2e55c82c461b44327dbef75b81a29230be7c460a0a87')
validpgpkeys=()

prepare() {
	cd "$srcdir/${_pkgname}-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/${_pkgname}-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/${_pkgname}-$pkgver"
	install -Dm755 "$srcdir/${_pkgname}-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
