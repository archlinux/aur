# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=comrak-git
pkgver=v0.57.0.r4.g800935e
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=(x86_64 i686)
url="https://github.com/kivikakk/${pkgname%-git}"
license=(BSD)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
makedepends=(cargo
             git)
source=("git+$url.git")
sha256sums=('SKIP')

_srcenv() {
	cd "${pkgname%-git}"
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
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=' -fno-lto'
	export RUSTONIG_DYNAMIC_LIBONIG=1
}

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --always --tags --abbrev=7 HEAD |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	_srcenv
	# Upstream Issue: https://github.com/kivikakk/comrak/pull/193
	cargo update
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package () {
	cd "${pkgname%-git}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
