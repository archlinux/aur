# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=gnome-search-provider-emoji-shortcodes
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="GNOME Search Provider for Emoji Shortcodes"
arch=(i686 x86_64 armv6h armv7h)
url="https://codeberg.org/mkhl/$pkgname"
license=(custom:0BSD)
groups=()
depends=(dbus gnome-shell)
makedepends=(cargo sed)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/mkhl/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('f8495b5ceb18b44dd4c54abf13e05485dacaef0aaba5ca077a1a181ccd56bda6dd54ecb1ab15094ad4dd32eed1c6f415e3e2de8a542947d85ef1779f5666f54d')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
	make CARGO=true PREFIX=/usr LIBEXECDIR=/usr/lib
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	make CARGO=true DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
