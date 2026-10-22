# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=val
pkgver=0.7.0
pkgrel=2
pkgdesc='an arbitrary precision calculator language'
url="https://github.com/terror/$pkgname"
arch=(x86_64)
license=(CC0-1.0)
depends=(glibc # libc.so
         gmp # libgmp.so
         libgcc
         mpfr)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('c29d753147a2523a6c8f25079e9e42d3b839af0331cb77ef39f7059e38bf9eb4')

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
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# Devendor gmp-mpfr-sys
	export CARGO_FEATURE_USE_SYSTEM_LIBS=true
}

prepare() {
	_srcenv
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

package() {
	depends+=(libgcc_s.so
	          libmpfr.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
