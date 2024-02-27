# Maintainer: fossdd <fossdd@pwned.life>

pkgname=bpftop
pkgver=0.2.1
pkgrel=1
pkgdesc="bpftop provides a dynamic real-time view of running eBPF programs"
url='https://github.com/Netflix/bpftop'
license=(Apache-2.0)
arch=(x86_64)
depends=(glibc libelf gcc-libs zlib)
makedepends=(cargo git)
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.zip")
sha256sums=('2958c779bb12c0c08fe094b5e1dc87677800d15048e6ed92d3f57a3491eb88d7')

prepare() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname/"
}
