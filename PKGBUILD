# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=rquickshare
pkgver=0.11.5
pkgrel=2
pkgdesc=" Rust implementation of NearbyShare/QuickShare from Android for Linux and macOS."
arch=(x86_64)
url="https://github.com/Martichou/rquickshare"
license=('GPL-3.0-or-later')
depends=('glibc' 'glib2' 'gdk-pixbuf2' 'hicolor-icon-theme' 'gtk3' 'webkit2gtk-4.1' 'dbus' 'gcc-libs' 'libsoup3' 'cairo')
makedepends=('cargo' 'pnpm' 'protobuf')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6a82d63412703aa42c343619806cc0dec28ffcf164fb04c5b0bfd17b22257af3')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	pushd "$srcdir/$pkgname-$pkgver/core_lib"
	pnpm i
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	pushd "$srcdir/$pkgname-$pkgver/app/main/src-tauri"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	pnpm i

}

build() {
	cd "$srcdir/$pkgname-$pkgver/core_lib"
	export RUSTUP_TOOLCHAIN=stable
	export CFLAGS="$CFLAGS -ffat-lto-objects"
	cargo build --frozen --release --all-features
	cd "$srcdir/$pkgname-$pkgver/app/main"
	pnpm tauri build -b deb -t "$(rustc -vV | sed -n 's/host: //p')"

}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 app/main/src-tauri/target/$(rustc -vV | sed -n 's/host: //p')/release/${pkgname} "$pkgdir/usr/bin/$pkgname"
	install -Dm644 snap/gui/r-quick-share.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
	install -Dm644 snap/gui/r-quick-share.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.desktop"
	sed -i 's/\${SNAP}\/meta\/gui\/r-quick-share.png/rquickshare/g' "$pkgdir/usr/share/applications/${pkgname}.desktop"
	sed -i 's/r-quick-share/rquickshare/g' "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
