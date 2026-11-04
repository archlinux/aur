# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=isocast-git
_pkgname=${pkgname%-git}
pkgver=0.0.10.r21.g2ddcc6d
pkgrel=1
url="https://$_pkgname.xyz"
_url="https://github.com/anomalyco/$_pkgname"
pkgdesc='OBS alternative that records every source as its own file (Git HEAD'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(alsa-lib
         fontconfig
         glibc # libc.so libm.so
         gst-plugins-base-libs
         hicolor-icon-theme
         libgcc
         libpipewire
         openh264
         webkitgtk-6.0)
makedepends=(cargo
             clang
             cmake
             git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$_url.git")
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
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	CFLAGS+=' -fno-lto'
	export OPENH264_INCLUDE_PATH=/usr/include/wels
	export OPENH264_LIBRARY_PATH=/usr/lib
}

_icons=(512 256 128 64 48 32 24 16)

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	_srcenv
	cargo build --frozen --release -p isocast-cli -p isocast-daemon -p isocast-ui -p isocast-browser
}

package() {
	depends+=(libasound.so
	          libgcc_s.so)
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"{,d,-ui,-browser}
	install -Dm0644 -t "$pkgdir/usr/share/applications/" packaging/linux/dev.isocast.${_pkgname^}.desktop
	install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" packaging/linux/icons/hicolor/scalable/apps/dev.isocast.${_pkgname^}.svg
	for s in ${_icons[@]}; do
		local dim="${s}x${s}"
		install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/$dim/apps/" packaging/linux/icons/hicolor/$dim/apps/dev.isocast.${_pkgname^}.png
	done
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
