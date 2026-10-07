# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=artcraft-git
_pkgname=${pkgname%-git}
pkgver=0.41.0.r8.g3e5793b
pkgrel=1
url="https://getartcraft.com/apps/$_pkgname"
_url="https://github.com/storytold/$_pkgname"
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
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$_url.git")
sha256sums=('SKIP')

_srcenv() {
	cd "$_pkgname"
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
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 --match="$_pkgname-v*" HEAD |
			sed -e "s/^$_pkgname-v//" -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	_srcenv
	cargo build --frozen --release
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
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
