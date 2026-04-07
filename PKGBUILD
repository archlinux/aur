# Maintainer: 

# WARNING to potential users/maintainers. This upstream project is AI slop with
# an edge of danger because the OP controlling the project isn't actually
# competent enough with the Git reflog themselves to even notice when there are
# discrepencies with what the LLM is spewing out and reality. Just beware.

pkgname=git-time-machine
pkgver=0.2.5
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
sha256sums=('0513bf48f1e5ad48195419cd0766b4948a556ac11a7f8fd9f27d7e96ab1f92a3')

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
