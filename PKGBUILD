# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=git-branchless
pkgver=0.7.1
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
sha256sums=('90a69356573acd0984607749cc18706c5a2410e1d59b553df5271ad3e4147dbf')

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
	local _target="target/release/$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_target"
	$_target install-man-pages "$pkgdir/usr/share/man/man1/"
}
