# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=oleafly
_pkgname=${pkgname^}
pkgver=0.4.5
pkgrel=1
url="https://$pkgname.com"
_url="https://github.com/$_pkgname/$_pkgname"
pkgdesc='a local-first AI assisted research workspace for scientific writing & publishing'
arch=(x86_64)
license=(MIT)
depends=(biber
         cairo
         dbus
         gdk-pixbuf2
         glib2
         glibc # libc.so libm.so
         gtk3
         libgcc
         libsoup3
         tectonic
         pandoc-cli
         typst
         tinymist
         webkit2gtk-4.1)
makedepends=(cargo
             cargo-tauri
             gendesk
             nodejs-lts-krypton
             pnpm)
options=(!lto)
_archive="$_pkgname-$pkgver"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('c45c788abe8ead33cc8d64f3fa09c42fb61d91c762c9e4028068a0901e15584a')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
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
	cargo fetch --locked --target host-tuple
	mkdir -p src-tauri/binaries
	pushd src-tauri/binaries
	ln -sf /usr/bin/vendor_perl/biber "tectonic-biber-$CARCH-unknown-linux-gnu"
	ln -sf /usr/bin/pandoc "pandoc-$CARCH-unknown-linux-gnu"
	ln -sf /usr/bin/tectonic "tectonic-$CARCH-unknown-linux-gnu"
	ln -sf /usr/bin/typst "typst-$CARCH-unknown-linux-gnu"
}

build() {
	_srcenv
	pnpm build
	cargo-tauri build --no-bundle
}

package() {
	depends+=(libcairo.so
	          libdbus-1.so
	          libgcc_s.so
	          libgdk-3.so libgtk-3.so
	          libgdk_pixbuf-2.0.so
	          libgio-2.0.so libglib-2.0.so libgobject-2.0.so
	          libjavascriptcoregtk-4.1.so
	          libsoup-3.0.so
	          libwebkit2gtk-4.1.so)
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "src-tauri/target/release/$pkgname"-{cli,desktop}
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
