# Maintainer: Lily <pika@pikafan.de>
_pkgname=nitrolaunch
pkgname=$_pkgname-cli
pkgver=0.27.0
pkgrel=1
pkgdesc="A fast, extensible, and powerful Minecraft launcher (CLI Version)"
arch=(x86_64 aarch64)
url="https://github.com/Nitrolaunch/nitrolaunch"
license=('GPL-3.0-or-later')
depends=(gcc-libs glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f2329529ed3533c893ea4f4d22b4aa92d6387945351aeed3136deaae3cb70190')
options=(!lto)

prepare() {
	cd "$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
	cd "$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build -p nitro_cli --frozen --release --all-features
}

check() {
	cd "$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test -p nitro_cli --frozen --all-features
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/nitro"
}
