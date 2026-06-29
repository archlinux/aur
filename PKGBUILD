# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitv
pkgver=0.4.5
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
sha256sums=('b74b28c170060b1681ae26b0c59ee5245eba9967ff4d1e1bdd49d5303f1f07bd')

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
