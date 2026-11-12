# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=obs-avip
pkgver=0.1.0
pkgrel=1
pkgdesc='NDI® source and output for OBS in Rust, a drop-in for DistroAV'
arch=(x86_64)
license=(GPL-2.0-only)
url="https://github.com/obs-rust/$pkgname"
provides=(distroav
          obs-ndi)
conflicts=(distroav
           obs-ndi-bin)
depends=(avahi
         glibc # libc.so libm.so
         libgcc
         libndi
         obs-studio
         sndio)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('dc8b4cc2bc80046a403949b52279979adabc1208dde2ac472335dc669f80dc5c')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	if check_option debug y; then
		export CARGO_PROFILE_RELEASE_DEBUG=2
		export CARGO_PROFILE_RELEASE_STRIP=false
	fi
	if check_option lto y; then
		export CARGO_PROFILE_RELEASE_LTO=thin
		export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	fi
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-lto'
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
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/lib/obs-plugins/" target/release/libobs_avip_plugin.so
}
