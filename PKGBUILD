# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=docspec
pkgver=1.21.2
pkgrel=1
pkgdesc='Rust implementation of DocSpec, a streaming document conversion library'
arch=(x86_64)
url="https://github.com/$pkgname/$pkgname"
license=(MIT)
depends=(glibc # libc.so libm.so
         libgcc libgcc_s.so)
makedepends=(cargo
             git)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('4778338b6ee01f0df88b5734ddd7e847208ba1d46def07ef0655f5b554bf69f4')

_srcenv() {
	cd "$pkgname"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -ffat-lto-objects'
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	cargo test --frozen --release
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
