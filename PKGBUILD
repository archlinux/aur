# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Christoph Wurst <christoph@winzerhof-wurst.at>

pkgname=krankerl
pkgver=0.14.3
pkgrel=1
epoch=1
pkgdesc='A CLI helper to manage, package, and publish Nextcloud apps'
arch=(x86_64)
url="https://github.com/ChristophWurst/$pkgname"
license=(GPL-3.0-only)
depends=(gcc-libs
         glibc
         libgit2
         libgit2.so)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('a65d4b4c3082db5aa4b90b335f5cbf175709d1648821361205bd130447d4dc4a')

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
	CFLAGS+=' -fno-lto'
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
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
