# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Marcell Pardavi <marcell.pardavi@gmail.com>

pkgname=zed-preview
pkgver=0.142.4
pkgrel=1
pkgdesc='A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter'
arch=(x86_64)
url=https://zed.dev
_url="https://github.com/zed-industries/${pkgname%-preview}"
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)
depends=(alsa-lib libasound.so
         fontconfig
         gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         # libgit2 libgit2.so
         # libxau libXau.so
         libxcb # libxcb-xkb.so
         # libxdmcp libXdmcp.so
         libxkbcommon # libxkbcommon.so
         libxkbcommon-x11 # libxkbcommon-x11.so
         openssl libcrypto.so libssl.so
         sqlite
         vulkan-driver
         vulkan-icd-loader
         vulkan-tools
         wayland
         zlib libz.so)
makedepends=(cargo
             clang
             vulkan-headers
             vulkan-validation-layers)
optdepends=('clang: improved C/C++ language support'
            'eslint: improved Javascript language support'
            'rust-analyzer: improved Rust language support')
replaces=(zed-editor-preview)
provides=("${pkgname%-preview}=$pkgver")
conflicts=("${pkgname%-preview}")
_archive="zed-$pkgver-pre"
source=("$_url/archive/v$pkgver-pre/$_archive.tar.gz"
        use-lib-not-libexec.patch)
sha256sums=('ed1871604a887dd84ebad5a746904cd760799e088252ab85b89e11db56bd7360'
            '180f8f84cd4320a758225ccb016cd6fc46146f1e7ba6d2c3b75decee8b89989d')

_binname=zeditor
_appid=dev.zed.Zed

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	export DO_STARTUP_NOTIFY="true"
	export APP_ICON="zed"
	export APP_NAME="Zed"
	export APP_CLI="$_binname"
	export APP_ID="$_appid"
	envsubst < "crates/zed/resources/zed.desktop.in" > $_appid.desktop
	patch -p0 -i ../use-lib-not-libexec.patch
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
	cargo build --release --frozen --package zed --package cli
}

# Tests assume access to vulkan video drivers, Wayland window creation,
# detecting system keymaps, etc. Until their is something sensical for
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
	install -Dm0644 crates/zed/resources/app-icon.png "$pkgdir/usr/share/icons/${pkgname%-preview}.png"
}
