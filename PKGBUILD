# Maintainer: William Whittaker <william@mailliw.org>

pkgname=hummingbird-player
_pkgname=hummingbird
pkgver=0.4.1
pkgrel=1
pkgdesc="Modern music player written in Rust using GPUI with a focus on design and performance"
arch=(x86_64 aarch64)
url="https://git.mailliw.org/hummingbird/hummingbird"
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
         pipewire libpipewire-0.3.so
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
             cargo-cntp-bundle-git
             base-devel
             clang)
options=(!debug)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(7f449676b683ce7fc2b3ec7f18eadfb146771ab252f025c348064d4c46628bf8)

prepare() {
	cd "$_pkgname"
	cargo fetch --locked
}

build() {
	cd "$_pkgname"
	CFLAGS+=' -ffat-lto-objects'
	CXXFLAGS+=' -ffat-lto-objects'
	export HUMMINGBIRD_RELEASE_CHANNEL=stable
	# no real better way to do this without incurring some costs
	# this isn't as bad as it seems, without the local user's keys these are read-only (and even then all you can do is scrobble)
	# and the local user's keys are only stored on their computer
	# still unfortunate, though
	export LASTFM_API_KEY="7bbd03d0dda426841c6d812f16851d45"
	export LASTFM_API_SECRET="c9e763ffc75b2920aeebe914dfad449c"
	cargo build --release --locked
}

package() {
	cd "$_pkgname"
	export HUMMINGBIRD_RELEASE_CHANNEL=stable
	cargo cntp-bundle --no-open
	local appdir="target/bundle/$(rustc -vV | grep 'host:' | cut -d' ' -f2)/release/appdir"
	install -Dm755 "$appdir/usr/bin/hummingbird" "$pkgdir/usr/bin/hummingbird"
	install -Dm644 "$appdir/usr/share/applications/org.mailliw.hummingbird.desktop" \
		"$pkgdir/usr/share/applications/org.mailliw.hummingbird.desktop"
	install -Dm644 "$appdir/usr/share/icons/hicolor/scalable/apps/org.mailliw.hummingbird.svg" \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/org.mailliw.hummingbird.svg"
}
