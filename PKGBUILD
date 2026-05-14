# Maintainer: Lily <pika@pikafan.de>
# Maintainer: CarbonSmasher

_pkgname=nitrolaunch
pkgname=$_pkgname-cli
pkgver=0.30.0
pkgrel=1
pkgdesc="A fast, extensible, and powerful Minecraft launcher (CLI Version)"
arch=(x86_64 aarch64)
url="https://github.com/Nitrolaunch/nitrolaunch"
license=('GPL-3.0-or-later')
depends=(glibc gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3744898806226d97144989e458742deba773f8cdf086f5c242aba87ed9a031ef')
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
	cargo build -p nitro_cli --frozen --profile fast_release  --all-features
}

check() {
	cd "$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test -p nitro_cli --frozen --all-features
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/fast_release/nitro"
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions" "plugins/plugins/completions/zsh/_nitro"
}
