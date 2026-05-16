# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=nightingale
pkgver=0.6.0
pkgrel=2
pkgdesc="Machine learning powered Karaoke app (with scores!)"
arch=('x86_64')
url="https://github.com/rzru/nightingale"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'alsa-lib' 'glib2' 'webkit2gtk-4.1' 'cairo' 'gtk3' 'gdk-pixbuf2' 'libsoup3')
makedepends=('cargo' 'pnpm')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0690e5d99d9f48be9e4ef5eab081ea6d6d93533f41d226a30a46a5e1197cb1bf')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	cd "$srcdir/$pkgname-$pkgver/client/src-tauri"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	cd "$srcdir/$pkgname-$pkgver/client"
	pnpm i
}

build() {
	cd "$srcdir/$pkgname-$pkgver/client"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	#cargo build --frozen --release --all-features
	pnpm tauri build -t "$(rustc -vV | sed -n 's/host: //p')" --no-bundle
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 client/src-tauri/target/"$(rustc -vV | sed -n 's/host: //p')"/release/Nightingale "$pkgdir/usr/bin/${pkgname}"
}
