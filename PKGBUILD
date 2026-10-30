# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=MaterialCraft
pkgname=materialcraft-git
pkgver=0.5.0.r4.g6307ce2
pkgrel=1
url="https://github.com/PiJellyPin/$_pkgname"
pkgdesc='vibe coded clean-room reimplementation of Adobe Substance Designer (Git HEAD)'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         libgcc)
makedepends=(cargo
             git)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
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
	RUSTFLAGS+=" --remap-path-prefix $PWD=/"
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 HEAD |
			sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	_srcenv
	cargo build --frozen --release --features gui
}

package() {
	depends+=(libgcc_s.so)
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"{,-gui}
	install -Dm0644 assets/logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
