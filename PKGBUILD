# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=isocast
pkgver=0.0.10
pkgrel=1
url="https://$pkgname.xyz"
_url="https://github.com/R44VC0RP/$pkgname"
pkgdesc='OBS alternative that records every source as its own file'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(alsa-lib
         fontconfig
         glibc # libc.so libm.so
         gst-plugins-base-libs
         libgcc
         libpipewire
         openh264)
makedepends=(cargo
             clang
             cmake)
_archive="$pkgname-$pkgver"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('a6f2059a4f6d3541bec6bf0cee68473973bf8d81eb8deb64da56e1308c0098c4')

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
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	CFLAGS+=' -fno-lto'
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
	depends+=(libasound.so
	          libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"{,d,-ui}
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
