# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lingora
pkgver=0.4.15
pkgrel=1
pkgdesc='localization management TUI to analyse fluent translation files'
arch=(x86_64)
url="https://github.com/nigeleke/$pkgname"
license=(MIT)
depends=(gcc-libs # libgcc_s.so
         glibc) # libc.so libm.so ld-linux-x86-64
makedepends=(cargo-nightly
             cargo-edit)
_toolchain=nightly-2026-06-27
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('bcefcc4a3b25c53fe3467b0dec4bdd1fe79cc336685a65db990bc67535fe3878')

prepare() {
	_srcenv
	rustup toolchain install "$_toolchain"
	# https://github.com/nigeleke/lingora/issues/74
	cargo set-version $pkgver
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
