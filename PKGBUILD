# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf
_pkgname=miro
pkgver=0.6.1
pkgrel=1
pkgdesc="A native pdf viewer for Windows and Linux (Wayland/X11) with configurable keybindings."
arch=('x86_64')
url="https://github.com/vincent-uden/miro"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'fontconfig')
makedepends=('cargo')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('19ab682dba3542d1a122e865fea91b2a82ad9dac651111fdfeb7d71d20c34e05')
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
