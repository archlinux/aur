# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=plainva
pkgver=0.2.1
pkgrel=1
url="https://$pkgname.com"
_url="https://github.com/$pkgname/$pkgname"
pkgdesc='Obsidian-compatible, local-first editor for plain Markdown vaults'
arch=(x86_64)
license=(MIT)
depends=(cairo libcairo.so
         dbus libdbus-1.so
         gdk-pixbuf2 libgdk_pixbuf-2.0.so
         glib2 libgio-2.0.so libglib-2.0.so libgobject-2.0.so
         glibc # libc.so libm.so
         gtk3 libgdk-3.so libgtk-3.so
         libgcc libgcc_s.so
         libsoup3 libsoup-3.0.so
         webkit2gtk-4.1 libjavascriptcoregtk-4.1.so libwebkit2gtk-4.1.so)
makedepends=(cargo
             cargo-tauri
             turbo
             gendesk
             nodejs-lts-krypton
             pnpm)
options=(!lto)
_archive="$pkgname-$pkgver"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('305cbf2d3566dfd3549c1c780bf698d9cfc4890b8198376b4c4f677559316c86')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	RUSTFLAGS+=" --remap-path-prefix $PWD=/"
}

prepare() {
	gendesk -q -f -n \
		--pkgname "$pkgname" \
		--pkgdesc "$pkgdesc" \
		--exec "$pkgname-desktop" \
		--custom StartupWMClass="$pkgname"
	_srcenv
	pnpm install --frozen-lockfile
	pushd apps/desktop/src-tauri
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	turbo run build
	pushd apps/desktop/src-tauri
	cargo-tauri build --no-bundle
}

package() {
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	pushd apps/desktop/src-tauri
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname-desktop"
	install -Dm0644 icons/128x128@2x.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
