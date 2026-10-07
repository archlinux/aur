# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=artcraft
pkgver=0.41.0
pkgrel=3
url="https://getartcraft.com"
_url="https://github.com/storytold/$pkgname"
pkgdesc='IDE for interactive AI image and video creation'
arch=(x86_64)
license=(MIT)
depends=(alsa-lib
         atkmm
         cairo
         dbus
         gdk-pixbuf2
         glib2
         glibc # libc.so libm.so
         gtk3
         libgcc
         libstdc++
         libsoup3
         openssl
         pango
         sqlite
         webkit2gtk-4.1)
makedepends=(cargo
             cargo-tauri
             clang
             cmake
             git
             nodejs-lts-krypton
             npm)
options=(!lto)
_tag="$pkgname-v$pkgver"
_archive="$pkgname-$_tag"
source=("$_url/archive/refs/tags/$_tag/$_archive.tar.gz")
sha256sums=('c10a89be18b8322e51d9ee6985032ba79872ceb0477beaf72c753d4340baba00')

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
	# CFLAGS+=' -fno-lto'
	# CPPFLAGS+=' -fno-lto'
	RUSTFLAGS+=" --remap-path-prefix $PWD=/"
	export SQLX_OFFLINE=true
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
	pushd frontend
	npm ci --allow-git=all --dangerously-allow-all-scripts --no-audit --no-fund
}

build() {
	_srcenv
	# cargo tauri build
	pushd frontend
	env \
		VITE_ENVIRONMENT_TYPE=production \
		NODE_OPTIONS=--max-old-space-size=8192 \
		npx nx run artcraft:build
	popd
	# feature enabled to trigger production mode to embed assets
	cargo build --frozen --release --features tauri/custom-protocol
}

package() {
	depends+=(libasound.so
	          libcairo.so
	          libdbus-1.so
	          libgcc_s.so
	          libgdk-3.so libgdk_pixbuf-2.0.so libgtk-3.so libwebkit2gtk-4.1.so
	          libgio-2.0.so
	          libglib-2.0.so
	          libgobject-2.0.so
	          libjavascriptcoregtk-4.1.so
	          libsoup-3.0.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
