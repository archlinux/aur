# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf
_pkgname=miro
pkgver=0.12.0
pkgrel=1
pkgdesc="A native pdf viewer for Windows and Linux (Wayland/X11) with configurable keybindings."
arch=('x86_64')
url="https://github.com/vincent-uden/miro"
license=('AGPL-3.0-or-later')
depends=('glibc' 'libstdc++' 'libgcc' 'fontconfig' 'xdotool' 'gdk-pixbuf2' 'gtk3' 'glib2')
makedepends=('cargo' 'clang' 'unzip')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=('58f1e2f245da9bf9de0f669ff0ce467aabecd9ae796be21abf78e8ac832646e1')
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
