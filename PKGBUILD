# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=carve-rs
pkgver=0.1.4
pkgrel=1
pkgdesc='Rust parser and HTML renderer for the Carve markup language'
arch=(x86_64)
url="https://github.com/markup-carve/$pkgname"
license=(MIT)
depends=(glibc # libc.so
         libgcc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/$pkgver/$_archive.tar.gz")
sha256sums=('ad0f7e70a78429f2dc2c848863fd1318b687bcda8aebb9441cd7c8945a6a8570')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-fto'
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

prepare() {
	_srcenv
	# Upstream project neglected to trock the lock file at all, this package will *not*
	# be reproducible. See https://github.com/markup-carve/carve-rs/issues/1466
	cargo update
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	cargo test --frozen
}

package() {
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-rs}"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
