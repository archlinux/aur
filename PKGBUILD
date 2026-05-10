# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf
_pkgname=miro
pkgver=0.9.0
pkgrel=1
pkgdesc="A native pdf viewer for Windows and Linux (Wayland/X11) with configurable keybindings."
arch=('x86_64')
url="https://github.com/vincent-uden/miro"
license=('AGPL-3.0-or-later')
depends=('glibc' 'libstdc++' 'libgcc' 'fontconfig')
makedepends=('cargo' 'clang')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=('3ed28fa23f700bb9bbabbc3415b5ad9c9baa3cac7d9558ebc90314ca9fab1a9b')
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
	export CXXFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/${_pkgname}-$pkgver"
	install -Dm755 "$srcdir/${_pkgname}-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/${_pkgname}-$pkgver/assets/default.conf" "$pkgdir/usr/share/${pkgname}/miro.conf"
}
