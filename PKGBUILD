# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitv
pkgver=0.3.4
pkgrel=1
pkgdesc='a terminal-based viewer for GitHub issues'
url="https://github.com/JayanAXHF/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(libgcc libgcc_s.so
         glibc) # libc.so libm.so
makedepends=(cargo)
checkdepends=(git)
_archive="$pkgname-tui-v$pkgver"
source=("$url/archive/$_archive/$_archive.tar.gz")
sha256sums=('9cdff28b648df73187adb1aec09fb87dbbcce1f590ffee85884b39f48366107f')

prepare() {
	cd "$pkgname-$_archive"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$pkgname-$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
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
	cd "$pkgname-$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}
