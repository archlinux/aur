# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf
_pkgname=miro
pkgver=0.6.3
pkgrel=1
pkgdesc="A native pdf viewer for Windows and Linux (Wayland/X11) with configurable keybindings."
arch=('x86_64')
url="https://github.com/vincent-uden/miro"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'fontconfig')
makedepends=('cargo' 'clang')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a8e8b402ada821ff7a93f5a8c4b77c071848ed05eb6c5ac13e8813454985f9f6')
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
