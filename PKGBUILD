# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=git-superprune
pkgver=0.1.7
pkgrel=1
pkgdesc='a git command to prune remote branches that have already been merged'
arch=(x86_64)
url="https://github.com/graysonarts/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo
             git)
options=(!lto)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
# source=("$_archive.tar.gz::https://static.crates.io/crates/$pkgname/$_archive.crate")
sha256sums=('cbfa1a46754a72750d6ff8b8a688628644a9bf00d504b1f9429ed22276624c75')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export LIBGIT2_SYS_USE_PKG_CONFIG=1
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	local skipped=()
	cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	# install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
