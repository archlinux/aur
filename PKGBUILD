# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=giff
pkgver=1.2.0
pkgrel=1
pkgdesc='A terminal-based Git diff viewer with interactive rebase capabilities'
arch=(x86_64 aarch64)
url="https://github.com/bahdotsh/$pkgname"
license=(MIT)
depends=(git
         gcc-libs libgcc_s.so
         glibc) # libc.so libm.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('475d192ad861e7bba5b881d9ce12459e7b918ad20c9214324a76271092c4a13c')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	cargo test --frozen --release
}

package () {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
