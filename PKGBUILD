# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgdesc='A terminal user interface that extracts and displays tasks from notes files'
pkgname=taskfinder
pkgver=2.19.0
pkgrel=1
url="https://codeberg.org/kdwarn/$pkgname"
arch=(x86_64)
license=(AGPL-3.0-or-later)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c6ee7fc78213c422785770b6754cf43fe0f5e0fede5f7919bde26135312b3513')

_srcenv() {
	cd "$pkgname"
	export CARGO_HOME="$srcdir"
	if check_option debug y; then
		export CARGO_PROFILE_RELEASE_DEBUG=2
		export CARGO_PROFILE_RELEASE_STRIP=false
	fi
	if check_option lto y; then
		export CARGO_PROFILE_RELEASE_LTO=thin
		export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	fi
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
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
