# Maintainer: nerdyslacker <karyan40024@gmail.com>
pkgname=gram
pkgver=1.0.0
pkgrel=1
pkgdesc='A code editor for humanoid apes and grumpy toads'
arch=(x86_64)
url=https://gram.liten.app
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)
depends=(alsa-lib libasound.so
         curl libcurl.so
         fontconfig
         glibc # libc.so libm.so libresolv.so
         libgcc libgcc_s.so
         # libgit2 libgit2.so
         libstdc++ libstdc++.so
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
            'rust-analyzer: improved Rust language support'
            'org.freedesktop.secrets: to keep you logged into your Zed account')
replaces=(gram-editor)
source=("https://codeberg.org/GramEditor/gram/archive/$pkgver.tar.gz")
sha256sums=('27ff4148d5d191cd9ce36c5f8c2284898e0de9ad0cab04e3ad6fe5d1247f9bbb')

_binname=gram
_appid=se.ziran.Gram

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
	export DO_STARTUP_NOTIFY="true"
	export APP_ICON="gram"
	export APP_NAME="Gram"
	export APP_CLI="$_binname"
	export APP_ID="$_appid"
	export APP_ARGS="%U"
	envsubst < "crates/gram/resources/gram.desktop.in" > $_appid.desktop
	./script/generate-licenses
}

_srcenv() {
	cd "$pkgname"
	CFLAGS+=' -ffat-lto-objects'
	CXXFLAGS+=' -ffat-lto-objects'
	RUSTFLAGS+=" --remap-path-prefix $PWD=/"
}

build() {
	_srcenv
	export GRAM_UPDATE_EXPLANATION='Updates are handled by pacman'
	export RELEASE_VERSION="$pkgver"
	export PROTOC=/usr/bin/protoc
	export PROTOC_INCLUDE=/usr/include
	cargo build --release --frozen --package gram --package cli
}

package() {
	cd "$pkgname"
	install -Dm0755 target/release/cli "$pkgdir/usr/bin/$_binname"
	install -Dm0755 target/release/gram "$pkgdir/usr/lib/$pkgname/gram-editor"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$_appid.desktop"
	install -Dm0644 crates/gram/resources/app-icon.png "$pkgdir/usr/share/icons/$pkgname.png"
}
