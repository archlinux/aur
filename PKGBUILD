# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=smaragd
pkgver=0.5.1
pkgrel=1
pkgdesc='Native desktop authoring tool for writers'
arch=(x86_64)
url="https://github.com/ljantzen/$pkgname"
license=(GPL-3.0-only)
depends=(glibc # libc.so libm.so
         libgcc libgcc_s.so)
makedepends=(cargo)
optdepends=(git)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('b4cb6a00dd528a01e57d68b681fe06bf8d7b625fe335fb238ef87b0227359808')

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
