# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
pkgname=gdscript-formatter
pkgver=0.25.0
pkgrel=1
pkgdesc='A fast code formatter for GDScript and Godot 4'
arch=('x86_64')
url='https://www.gdquest.com/library/gdscript_formatter/'
license=('MIT')
depends=(glibc libgcc)
makedepends=(cargo git)
# Need to clone Git repo since GitHub archives lack the full source code
# <https://github.com/GDQuest/GDScript-formatter/issues/344>
source=("$pkgname-$pkgver::git+https://github.com/GDQuest/GDScript-formatter.git#tag=$pkgver")
sha256sums=('1eb407c2bb43616639707e2f311595b474b8307de2561145e46ccb9a036d9cb1')

prepare() {
	cd "gdscript-formatter-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "gdscript-formatter-$pkgver"
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
	cd "gdscript-formatter-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features --workspace
}

package() {
	cd "gdscript-formatter-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
