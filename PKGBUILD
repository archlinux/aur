# Maintainer: Caleb Maclennan <caleb@alerque.com>

_sha=cd5236282a66e4873b199ffbbba15ef524814974

_pkgname=ScreenCraft
pkgname=screencraft
pkgver=0.0.0
pkgrel=1
url="https://$pkgname.mdnlabs.dev"
_url="https://github.com/MarshallNickolauson/$_pkgname"
pkgdesc='vibe coded clean-room reimplementation of Screen Studio'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(alsa-lib
         glibc # libc.so libm.so
         hicolor-icon-theme
         libgcc
         libxtst
         pipewire-v4l2
         xdg-desktop-portal)
makedepends=(cargo
             clang
             cmake)
_archive="$_pkgname-$_sha"
options=(!lto)
source=("$_url/archive/$_sha/$_archive.tar.gz")
sha256sums=('45db7b43827dfde90f661d19a77f8ee087f1eb04747e20c0aefc841efeb9bcfe')

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

_icons=(128 32)

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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"{,-cli}
	for s in ${_icons[@]}; do
		local dim="${s}x${s}"
		install -Dm0644 "assets/icons/$dim.png" "$pkgdir/usr/share/icons/hicolor/$dim/apps/${pkgname%-git}.png" 
	done
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
