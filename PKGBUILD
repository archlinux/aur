# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=reld
pkgver=0.2.3
pkgrel=1
pkgdesc='fork of weld, polylinker supporting incremental linking on macOS/Windows/Linux'
arch=(x86_64)
url="https://github.com/zackees/$pkgname"
license=(BSD-3-Clause)
depends=(glibc
         libgcc)
makedepends=(cargo)
checkdepends=(clang)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('f3d6c7f1b538894a3f21e7fb39c33104694bd23d72a5187553eafb803cf83d38')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-lto'
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --release --frozen
}

check() {
	_srcenv
	local skipped=()
	# cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
