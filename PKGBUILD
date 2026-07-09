# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Marcell Pardavi <marcell.pardavi@gmail.com>

pkgname=zed-git
_pkgname=${pkgname%-git}
pkgver=1.9.0.r87.g53e4d34
pkgrel=1
pkgdesc='A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter'
arch=(x86_64)
url=https://zed.dev
_url="https://github.com/zed-industries/$_pkgname"
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)
depends=(alsa-lib libasound.so
         curl
         fontconfig
         git
         glib2 libgio-2.0.so libglib-2.0.so libgobject-2.0.so
         glibc # libc.so libm.so ld-linux-x86_64.so
         libgcc libgcc_s.so
         libstdc++ libstdc++.so
         libxcb # libxcb.so libxcb-xkb.so
         libx11 # libX11-xcb.so
         libxkbcommon libxkbcommon.so
         libxkbcommon-x11 libxkbcommon-x11.so
         netcat
         'nodejs>=18'
         npm
         sqlite libsqlite3.so
         vulkan-driver
         vulkan-icd-loader
         vulkan-tools
         wayland
         zstd libzstd.so)
makedepends=(cargo
             cargo-about
             clang
             cmake
             git
             protobuf
             vulkan-headers
             vulkan-validation-layers)
optdepends=('org.freedesktop.secrets: to keep you logged into your Zed account')
replaces=(zed-editor-git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$pkgname::git+$_url.git")
sha256sums=('SKIP')

_binname=zeditor
_appid=dev.zed.Zed-Dev

_srcenv() {
	cd "$pkgname"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
	CXXFLAGS+=' -ffat-lto-objects'
	RUSTFLAGS+=" --remap-path-prefix $PWD=/"
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
	export ZSTD_SYS_USE_PKG_CONFIG=1
}

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target host-tuple
	export DO_STARTUP_NOTIFY="true"
	export APP_ICON="zed"
	export APP_NAME="Zed"
	export APP_CLI="$_binname"
	export APP_ID="$_appid"
	export APP_ARGS="%U"
	export BRANDING_LIGHT="#99c1f1"
	export BRANDING_DARK="#1a5fb4"
	envsubst < "crates/zed/resources/zed.desktop.in" > $_appid.desktop
	envsubst < "crates/zed/resources/flatpak/zed.metainfo.xml.in" > $_appid.metainfo.xml
	sed -i '/@release_info@/d' $_appid.metainfo.xml
	./script/generate-licenses
}

pkgver() {
	cd "$pkgname"
	local lasttag="$(git tag --sort=-v:refname | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+-pre$' | head -1)"
	echo -n "$(sed 's/^v//;s/-pre$//' <<< "$lasttag")"
	echo -n ".r$(git rev-list "$(git merge-base HEAD "$lasttag")..HEAD" --count)"
	echo -n ".g$(git log --pretty=format:'%h' --abbrev=7 -n1 HEAD)"
}

build() {
	_srcenv
	export ZED_UPDATE_EXPLANATION='Updates are handled by pacman'
	export RELEASE_VERSION="$pkgver"
	export PROTOC=/usr/bin/protoc
	export PROTOC_INCLUDE=/usr/include
	cargo build --release --frozen --package zed --package cli
}

# Tests assume access to vulkan video drivers, Wayland window creation,
# detecting system keymaps, etc. Until there is something sensical for
# a package to test in the suite, just skip it by default.
check() {
	_srcenv
	# cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm0755 target/release/cli "$pkgdir/usr/bin/$_binname"
	install -Dm0755 target/release/zed "$pkgdir/usr/lib/$_pkgname/zed-editor"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$_appid.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/metainfo/" "$_appid.metainfo.xml"
	install -Dm0644 crates/$_pkgname/resources/app-icon.png "$pkgdir/usr/share/icons/$_pkgname.png"
}
