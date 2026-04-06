# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=git-time-machine
pkgver=0.2.3
pkgrel=1
pkgdesc='TUI for undoing mistakes using Git reflog'
arch=(x86_64)
url="https://github.com/raphlinus/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::https://static.crates.io/crates/$pkgname/$_archive.crate")
        # "$_archive-LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('8eea9bf3f10b91dc31ccd17af5809676f45a800b1ee839e3d747ba9ce7080bd2')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
	# cp ../$_archive-LICENSE LICENSE
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
	# install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
