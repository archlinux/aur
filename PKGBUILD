# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=git-igitt
pkgver=0.2.1
pkgrel=1
pkgdesc='TUI with clear git graphs arranged for your branching model'
url="https://github.com/mlange-42/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(dbus
         libgcc libgcc_s.so
         glibc # libc.so libm.so
         libgit2 libgit2.so
         zlib libz.so)
makedepends=(cargo
             clang)
checkdepends=(git)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('677c3d257ed70e3df672a56714c645a432388a047496fd9ccc1389a11cea008d')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
	export LIBGIT2_NO_VENDOR=1
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
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
