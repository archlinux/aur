# Maintainer: William Whittaker <william@mailliw.org>

pkgname=hummingbird-player
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern music player written in Rust using GPUI with a focus on design and performance"
arch=(x86_64 aarch64)
url="https://github.com/hummingbird-player/hummingbird"
license=(Apache-2.0)
groups=()
depends=(alsa-lib libasound.so
         curl libcurl.so
         fontconfig
         gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         libxcb # libxcb.so libxcb-xkb.so
         libxkbcommon # libxkbcommon.so
         libxkbcommon-x11 # libxkbcommon-x11.so
         openssl libcrypto.so libssl.so
         vulkan-driver
         vulkan-icd-loader
         vulkan-tools
         wayland
         zlib libz.so
         zstd libzstd.so)
makedepends=(cargo
             rust
             cmake
             vulkan-headers
             vulkan-validation-layers
             cargo-cntp-bundle-git)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/hummingbird-player/hummingbird/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=(55c47c1fc1f1cec5eab1c0bb19e7af32722f1981e63730f206384e6e2799634d)

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked
}

build() {
	cd "$pkgname-$pkgver"
	CFLAGS+=' -ffat-lto-objects'
	CXXFLAGS+=' -ffat-lto-objects'
    cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	cargo cntp-bundle --no-open
	cp -r target/bundle/$(rustc -vV | grep 'host:' | cut -d' ' -f2)/release/appdir/*/ ${pkgdir}
}
