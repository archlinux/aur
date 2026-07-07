# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=nightingale
pkgver=0.9.1
pkgrel=1
pkgdesc="Machine learning powered Karaoke app (with scores!)"
arch=('x86_64')
url="https://github.com/rzru/nightingale"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'alsa-lib' 'glib2' 'webkit2gtk-4.1' 'cairo' 'gtk3' 'gdk-pixbuf2' 'libsoup3')
makedepends=('cargo' 'pnpm')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('29ea86cd8b11f0dff90b1b347b90906381dc4b22993fd7806987bae1cbed821d')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	cd "$srcdir/$pkgname-$pkgver/client/src-tauri"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	cd "$srcdir/$pkgname-$pkgver/client"
	pnpm c --location project set store-dir "${srcdir}/pnpm-store"
	pnpm c --location project set cacheDir "${srcdir}/pnpm-cache"
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
