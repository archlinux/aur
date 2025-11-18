# Maintainer: William Whittaker <william@mailliw.org>

pkgname=hummingbird-player
_pkgname=hummingbird
pkgver=0.1.0a
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
source=("$_pkgname-$pkgver.tar.gz::https://github.com/hummingbird-player/hummingbird/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=(31cc12053d1bedde5f6ed8a59b03ce7f8566b91697f0927b94aa0032ee67bbd0)

prepare() {
	cd "$_pkgname-$pkgver"
	cargo fetch --locked
}

build() {
	cd "$_pkgname-$pkgver"
	CFLAGS+=' -ffat-lto-objects'
	CXXFLAGS+=' -ffat-lto-objects'
	# no real better way to do this without incurring some costs
	# this isn't as bad as it seems, without the local user's keys these are read-only (and even then all you can do is scrobble)
	# and the local user's keys are only stored on their computer
	# still unfortunate, though
	export LASTFM_API_KEY="7bbd03d0dda426841c6d812f16851d45"
	export LASTFM_API_SECRET="c9e763ffc75b2920aeebe914dfad449c"
	cargo build --release --locked
}

package() {
	cd "$_pkgname-$pkgver"
	cargo cntp-bundle --no-open
	cp -r target/bundle/$(rustc -vV | grep 'host:' | cut -d' ' -f2)/release/appdir/*/ ${pkgdir}
}
