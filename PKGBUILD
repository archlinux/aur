# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=ScreenCraft
pkgname=screencraft-git
pkgver=0.0.0.r167.gcd52362
pkgrel=1
url="https://${pkgname%-git}.mdnlabs.dev"
_url="https://github.com/MarshallNickolauson/$_pkgname"
pkgdesc='vibe coded clean-room reimplementation of Screen Studio(Git HEAD)'
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
             cmake
             git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!lto)
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
	CFLAGS+=' -fno-lto'
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
}

_icons=(128 32)

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

pkgver() {
	cd "$_pkgname"
	git tag v0.0.0 a32cb8c ||:
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
			sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	_srcenv
	cargo build --frozen --release
}

package() {
	depends+=(libgcc_s.so)
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
	for s in ${_icons[@]}; do
		local dim="${s}x${s}"
		install -Dm0644 "assets/icons/$dim.png" "$pkgdir/usr/share/icons/hicolor/$dim/apps/${pkgname%-git}.png" 
	done
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
