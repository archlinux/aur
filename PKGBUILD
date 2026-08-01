# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=smaragd
pkgver=0.6.1
pkgrel=1
pkgdesc='Native desktop authoring tool for writers'
arch=(x86_64)
url="https://github.com/ljantzen/$pkgname"
license=(GPL-3.0-only)
depends=(glibc # libc.so libm.so
         libgcc libgcc_s.so)
makedepends=(cargo)
checkdepends=(git)
optdepends=('git: VCS integration')
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('e9c095027677c70b4772fdfa271837f3e2fe3c7f5e83f6ddd564b69cc2b4420d')

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
	CFLAGS+=' -ffat-lto-objects'
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
