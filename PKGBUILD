# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lazyage
pkgver=0.1.0
pkgrel=1
pkgdesc='LLM coded TUI wrapper for age encyption'
url="https://github.com/Spondycode/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(glibc # libc.so ld-linux-x86-64.so
         libgcc libgcc_s.so)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a6f402025e0938f6c49f2259ba8f3c9c7332c4e399c5a5ba39737f0ac01ae90f')

prepare() {
	cd "$_archive"
	# https://github.com/Spondycode/lazyage/issues/1
	cargo update
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	local skipped=(
	)
	cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
