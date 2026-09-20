# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
pkgname=gdscript-formatter
pkgver=0.26.2
pkgrel=1
pkgdesc='A fast code formatter for GDScript and Godot 4'
arch=(x86_64)
url='https://www.gdquest.com/library/gdscript_formatter/'
license=(MIT)
depends=(glibc libgcc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/GDQuest/GDScript-formatter/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('25c2653f2fc87d77ae67b7560a53c8458e55ef9333a58c4dac87efb5c9d736de')

prepare() {
	cd "GDScript-formatter-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "GDScript-formatter-$pkgver"
	# Strip GCC LTO flags to fix linker errors
	# <https://github.com/rust-lang/rust/issues/146952>
	export CFLAGS="${CFLAGS/-flto=auto/}"
	export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
	export LDFLAGS="${LDFLAGS/-flto=auto/}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "GDScript-formatter-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features --workspace
}

package() {
	cd "GDScript-formatter-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
