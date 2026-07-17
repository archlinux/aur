# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=val
pkgver=0.4.0
pkgrel=2
pkgdesc='an arbitrary precision calculator language'
url="https://github.com/terror/$pkgname"
arch=(x86_64)
license=(CC0-1.0)
depends=(glibc # libc.so
         gmp # libgmp.so
         libgcc libgcc_s.so
         mpfr libmpfr.so)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('38df3498c3103b3236999dc6fbc5a24295b5abd927950d074ffa7640a652a816')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
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
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
