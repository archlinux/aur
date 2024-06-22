# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=git-superprune
pkgver=0.1.2
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
sha256sums=('5c95726be304d4f23b2fdbd29319a0952f73eb78141093018a3ad23c60a88a32')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
