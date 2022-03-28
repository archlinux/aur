# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=git-branchless
pkgver=0.3.10
pkgrel=1
pkgdesc='High-velocity monorepo-scale workflow for Git'
url="https://github.com/arxanas/$pkgname"
arch=(x86_64)
license=(GPL2)
depends=(git
         libgit2)
makedepends=(cargo)
checkdepends=(git)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('916b0c6dc6d4dd8bcb678c75a24833e8d856d0298a71f3f539ed0fc78478cb75')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	# https://github.com/arxanas/git-branchless/issues/266
	export TEST_GIT=$(which git) TEST_GIT_EXEC_PATH=$(git --exec-path)
	cargo test --frozen --all-features
}

package () {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
