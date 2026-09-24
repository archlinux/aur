# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=flectar-mail
pkgver=0.1.0alpha.6
pkgrel=2
url="https://${pkgname%-*}.com"
_url="https://github.com/${pkgname/-//}"
pkgdesc='a lightweight, native client for email, calendars, and contacts'
arch=(x86_64)
license=(AGPL-3.0-only)
depends=(dbus
         fontconfig
         glibc # libc.so libm.so
         hicolor-icon-theme
         libgcc
         sqlite3
         wayland
#          libx11
#          libxcursor
#          libxi
#          libxkbcommon
#          libxkbcommon-x11
         xdg-utils)
makedepends=(cargo)
optdepends=('gnupg: OpenPGP signing and encryption'
            'org.freedesktop.secrets: secret service provider for storing account credentials'
            'xdg-desktop-portal: OAuth sign-in')
_tag=${pkgver/alpha/-alpha}
_archive="${pkgname#*-}-$_tag"
source=("$_url/archive/refs/tags/v$_tag/$_archive.tar.gz")
sha256sums=('e7c36bdbbe249feb143ec64caca4b27ebcd0a5741cb90db105856d801d0d2d57')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-lto'
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release
}

package() {
	depends+=(libdbus-1.so
	          libgcc_s.so
	          libsqlite3.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
