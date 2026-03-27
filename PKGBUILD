# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lingora
pkgver=0.4.13
pkgrel=1
pkgdesc='localization management TUI to analyse fluent translation files'
arch=(x86_64)
url="https://github.com/nigeleke/$pkgname"
license=(MIT)
depends=(gcc-libs # libgcc_s.so
         glibc) # libc.so libm.so ld-linux-x86-64
makedepends=(cargo-nightly)
_toolchain=nightly-2026-02-02
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('3f1b1a96ebfcc06b09df6b221bf9faad12a0842bb6433b84f3e0923964c4506a')

prepare() {
	_srcenv
	rustup toolchain install "$_toolchain"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN="$_toolchain"
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	cargo test --frozen --release
}

package () {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"-{cli,tui}
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
