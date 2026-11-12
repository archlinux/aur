# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=blaze-engine
_pkgname=${pkgname%-engine}
pkgver=0.20261027.0
pkgrel=1
pkgdesc='Incremental rust builds up to 92x faster than cargo/rustc'
arch=(x86_64)
url="https://github.com/indexable-inc/$_pkgname"
license=(Apache-2.0 MIT)
depends=(cargo-nightly
         glibc
         libgcc
         rustup)
_archive="$_pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('06d75f41fa8516778050dc95fd376b87e5a1be87da511fafa01e31294ecb87cf')

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
	export RUSTUP_TOOLCHAIN=nightly
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
	cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/"{blaze,cargo-blaze,cargo-ra-jit,ra-jit,ra-jit-rustc,ra-jit-rustc-first}
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
