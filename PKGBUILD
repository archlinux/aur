# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=obs-avip-git
_pkgname=${pkgname%-git}
pkgver=0.1.0.r4.g1c42ac1
pkgrel=3
pkgdesc='NDI® source and output for OBS in Rust, a drop-in for DistroAV'
arch=(x86_64)
license=(GPL-2.0-only)
url="https://github.com/obs-rust/${pkgname%-git}"
depends=(avahi
         glibc # libc.so libm.so
         libgcc
         libndi
         obs-studio
         sndio)
makedepends=(cargo
             git)
provides=("$_pkgname=$pkgver"
          distroav
          obs-ndi)
conflicts=("$_pkgname"
           distroav
           obs-ndi)
source=("git+$url.git")
sha256sums=('SKIP')

_srcenv() {
	cd "$_pkgname"
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

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	_srcenv
	cargo build --frozen --release
}

package() {
	depends+=(libgcc_s.so)
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/lib/obs-plugins/" target/release/libobs_avip_plugin.so
}
