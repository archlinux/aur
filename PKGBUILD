# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=soldr
pkgver=0.9.32
pkgrel=1
pkgdesc='leverage crgx and zccache to run Rust tools with cached results'
arch=(x86_64)
url="https://github.com/zackees/$pkgname"
license=(AGPL-3.0-only)
depends=(glibc
         libgcc)
makedepends=(cargo)
checkdepends=(clang)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('760cb353b119b1dfcc0ae1f9b500b033d85484492e07563e66435de802d4915b')

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
	local skipped=(
		cargo_front_door::line_endings::tests::crlf_probe_runs_once_for_lexical_aliases_of_a_repo
		cargo_front_door::line_endings::tests::no_warning_probe_result_is_cached_for_the_process 
	)
	cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
