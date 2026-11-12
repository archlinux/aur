# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=blaze-engine-git
_pkgname=${pkgname%-engine-git}
pkgver=0.20261109.1.r1103.g136432a
pkgrel=1
pkgdesc='Incremental rust builds up to 92x faster than cargo/rustc'
arch=(x86_64)
url="https://github.com/indexable-inc/$_pkgname"
license=(Apache-2.0 MIT)
depends=(cargo-nightly
         glibc # libc.so libm.so
         libgcc
         rustup)
makedepends=(git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
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
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target

}

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
	cargo build --release --frozen
}

check() {
	_srcenv
	local skipped=()
	cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	depends+=(libgcc_s.so)
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/"{blaze,cargo-blaze,cargo-ra-jit,ra-jit,ra-jit-rustc,ra-jit-rustc-first}
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
