# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ledgera
pkgver=0.1.0rc5
pkgrel=2
url="https://github.com/thesmokinator/$pkgname"
pkgdesc='Just another user interface for managing hledger journal transactions'
arch=(x86_64)
license=(MIT)
depends=(cairo libcairo.so
         dbus libdbus-1.so
         gdk-pixbuf2 libgdk_pixbuf-2.0.so
         glib2 libgio-2.0.so libglib-2.0.so libgobject-2.0.so
         glibc # libc.so libm.so
         gtk3 libgdk-3.so libgtk-3.so
         hledger
         libgcc libgcc_s.so
         libsoup3 libsoup-3.0.so
         openssl libcrypto.so libssl.so
         webkit2gtk-4.1 libjavascriptcoregtk-4.1.so libwebkit2gtk-4.1.so)
makedepends=(atkmm
             cargo
             cargo-tauri
             gendesk
             nodejs-lts-krypton
             npm)
options=(!lto)
_tag=${pkgver/rc/-rc.}
_archive="$pkgname-$_tag"
source=("$url/archive/refs/tags/v$_tag/$_archive.tar.gz")
sha256sums=('4e96e3b8257ec8e53c7c9582a77f62456bbe74334314fb76313df66019a2b9a5')

_srcenv() {
	cd "$_archive"
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	export OPENSSL_NO_VENDOR=true
}

prepare() {
	gendesk -q -f -n \
		--pkgname "$pkgname" \
		--pkgdesc "$pkgdesc" \
		--custom StartupWMClass="$pkgname"
	_srcenv
	npm install
	pushd src-tauri
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo-tauri build --no-bundle
}

package() {
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "src-tauri/target/release/$pkgname"
	install -Dm0644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
