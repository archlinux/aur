# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: pinks <aur at papepati dot page>

# Tests assume Git checkout, not source archive...
# https://github.com/biomejs/biome/issues/336
BUILDENV+=(!check)

pkgname=biome
pkgver=1.2.2
pkgrel=1
pkgdesc='Formatter, linter, and more for Javascript, Typescript, JSON, and CSS'
arch=(x86_64)
url=https://biomejs.dev
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
replaces=(rome)
_archive="$pkgname-cli-v$pkgver"
source=("https://github.com/biomejs/biome/archive/cli/v$pkgver/$_archive.tar.gz")
sha256sums=('744847d50e716a5ada7eea2f9862fdad6c5321c5aa3ad15c3169e170b2fa09e7')

prepare() {
	cd "$_archive/crates/${pkgname}_cli"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build -p "${pkgname}_cli"  --frozen --release --all-features
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	cargo test -p "${pkgname}_cli" --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
