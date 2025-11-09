# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf
_pkgname=miro
pkgver=0.7.2
pkgrel=1
pkgdesc="A native pdf viewer for Windows and Linux (Wayland/X11) with configurable keybindings."
arch=('x86_64')
url="https://github.com/vincent-uden/miro"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'fontconfig')
makedepends=('cargo' 'clang')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=('56fae99083c0ac414d88ed4e7fe658dd4b0d3cff754317dbe3d2507a8b6f55ab')
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
	install -Dm644 "$srcdir/${_pkgname}-$pkgver/assets/default.conf" "$pkgdir/usr/share/${pkgname}/miro.conf"
}
