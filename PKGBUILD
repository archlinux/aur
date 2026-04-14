# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgdesc='A terminal user interface that extracts and displays tasks from notes files'
pkgname=taskfinder
pkgver=2.15.0
pkgrel=1
url="https://codeberg.org/kdwarn/$pkgname"
arch=(x86_64)
license=(AGPL-3.0-or-later)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('da53f6640592d4129e63ad9eb5f6259f09c9bab3a1d5e322f8b4cefe71aa502d')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	local skipped=(
		# 2.15.0 links to 2.14.0 release docs
		tests::readme_contains_current_version_tag
	)
	cargo test --frozen --all-features -- ${skipped[@]/#/--skip }
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tf"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
