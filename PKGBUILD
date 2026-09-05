# Maintainer: Aaron Friesen <aaron@frie.dev>
pkgname=ftlman
pkgver=0.7.4
pkgrel=1
pkgdesc="Mod manager for FTL: Faster Than Light"
arch=('x86_64')
url="https://github.com/afishhh/ftlman"
license=('GPL-2.0-or-later')
depends=(
	bzip2
	fontconfig
	glibc
	libgcc
	libglvnd
	libx11
	libxcb
	libxcursor
	libxi
	libxkbcommon
	libxrender
	wayland
)
makedepends=(cargo-nightly pkg-config)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/afishhh/ftlman/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e8c2ea453e05e52349800140ca96cc0f6a954308264fe4113580b8a833be045a')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname-$pkgver"
	# Strip GCC LTO flags: the C code built by cc-crate (vendored lua) would
	# contain GCC LTO bytecode that rust-lld can't read
	# <https://github.com/rust-lang/rust/issues/146952>
	export CFLAGS="${CFLAGS/-flto=auto/}"
	export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
	export LDFLAGS="${LDFLAGS/-flto=auto/}"
	export RUSTFLAGS="--remap-path-prefix=${srcdir}=/ --remap-path-prefix=${HOME}=/"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
