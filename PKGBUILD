# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=yage
pkgver=0.5.0
pkgrel=2
pkgdesc='manage encrypted secrets in YAML files with age encryption'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/glehmann/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('76a7a8bd546622b02896e9cdc585fe4bbfdf7fdddf8218a73c748740966474ca')

_srcenv() {
	cd "$_archive"
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
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

prepare() {
	_srcenv
	# Upstream lockfile is broken
	cargo update
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
