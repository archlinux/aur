# Maintainer: Gigas002 <gigas002@pm.me>

pkgname=wayshot
pkgver=1.4.6
pkgrel=1
pkgdesc="Screenshot tool for wlroots compositors"
arch=(x86_64)
url="https://github.com/waycrate/$pkgname"
license=(BSD-2-Clause)
depends=(gcc-libs glibc libdrm libjxl mesa wayland)
optdepends=('slurp: alternative for region selection')
makedepends=(cargo git scdoc)
source=("git+$url#tag=v$pkgver")
b2sums=('SKIP')

prepare() {
	cd $pkgname

	# build.rs compiles and gzips man pages; we handle scdoc manually
	rm -f build.rs

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd $pkgname
	install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
	scdoc < docs/$pkgname.1.scd | install -Dm644 /dev/stdin "$pkgdir/usr/share/man/man1/$pkgname.1"
	scdoc < docs/$pkgname.5.scd | install -Dm644 /dev/stdin "$pkgdir/usr/share/man/man5/$pkgname.5"
	scdoc < docs/$pkgname.7.scd | install -Dm644 /dev/stdin "$pkgdir/usr/share/man/man7/$pkgname.7"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
