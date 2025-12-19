# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Marcell Pardavi <marcell.pardavi@gmail.com>

pkgname=zed-preview
_pkgname=${pkgname%-preview}
pkgver=0.218.3
pkgrel=1
pkgdesc='A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter'
arch=(x86_64)
url=https://zed.dev
_url="https://github.com/zed-industries/$_pkgname"
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)
depends=(alsa-lib libasound.so
         curl libcurl.so
         fontconfig
         gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         # libgit2 libgit2.so
         # libxau libXau.so
         libxcb # libxcb.so libxcb-xkb.so
         # libxdmcp libXdmcp.so
         libxkbcommon # libxkbcommon.so
         libxkbcommon-x11 # libxkbcommon-x11.so
         'nodejs>=18'
         netcat
         npm
         openssl libcrypto.so libssl.so
         sqlite
         vulkan-driver
         vulkan-icd-loader
         vulkan-tools
         wayland
         zlib libz.so
         zstd libzstd.so)
makedepends=(cargo
             cargo-about
             clang
             cmake
             protobuf
             vulkan-headers
             vulkan-validation-layers)
optdepends=('clang: improved C/C++ language support'
            'eslint: improved Javascript language support'
            'pyright: improved Python language support'
            'rust-analyzer: improved Rust language support')
replaces=(zed-editor-preview)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
_archive="zed-$pkgver-pre"
source=("$_url/archive/v$pkgver-pre/$_archive.tar.gz")
sha256sums=('f1f66846eb5fa85d3a01790a6554d9676b32271bdc0d86123a2fc3caa4c0b6d7')

_binname=zeditor
_appid=dev.zed.Zed-Preview

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
	export DO_STARTUP_NOTIFY="true"
	export APP_ICON="zed"
	export APP_NAME="Zed"
	export APP_CLI="$_binname"
	export APP_ID="$_appid"
	export APP_ARGS="%U"
	envsubst < "crates/zed/resources/zed.desktop.in" > $_appid.desktop
	./script/generate-licenses
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
	CXXFLAGS+=' -ffat-lto-objects'
	RUSTFLAGS+=" --remap-path-prefix $PWD=/"
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
	cd "$_archive"
	install -Dm0755 target/release/cli "$pkgdir/usr/bin/$_binname"
	install -Dm0755 target/release/zed "$pkgdir/usr/lib/zed/zed-editor"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$_appid.desktop"
	install -Dm0644 crates/zed/resources/app-icon.png "$pkgdir/usr/share/icons/$_pkgname.png"
}
