# Maintainer: George Rawlinson <grawlinson@archlinux.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=pulldown-cmark
pkgver=0.13.3
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=(x86_64)
url="https://github.com/raphlinus/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::https://static.crates.io/crates/$pkgname/$_archive.crate"
        "$_archive-LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('7c3a14896dfa883796f1cb410461aef38810ea05f2b2c33c5aded3649095fdad'
            'c4f10f55904bdb9f27d3fbf94c354926d6cfe8b982276e556238c258941b243b')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
	cp ../$_archive-LICENSE LICENSE
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	cargo test --frozen
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
