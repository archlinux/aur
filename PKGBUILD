# Maintainer: Gigas002 <gigas002@pm.me>
pkgname=wayshot
pkgver=1.6.0
pkgrel=1
pkgdesc="Screenshot tool for wlroots compositors"
arch=(x86_64)
url="https://github.com/waycrate/$pkgname"
license=(GPL-3.0-or-later BSD-2-Clause)
depends=(gcc-libs glibc cairo pango glib2 libdrm mesa wayland)
optdepends=('slurp: alternative for region selection')
makedepends=(cargo git scdoc)
source=("git+$url#tag=v$pkgver")
b2sums=('87d5f365c55e71dffe9d1d283a59d420d84e38c6e51213a871dc539ad000b15d68e51e3370a43576f37821b77c85c878eb0c64c1c3bfc24b49a6b368d8ea2022')

prepare() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p $pkgname --all-features
}

package() {
	cd $pkgname
	install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
	local _sec
	for _sec in 1 5 7; do
		scdoc < docs/$pkgname.$_sec.scd | install -Dm644 /dev/stdin "$pkgdir/usr/share/man/man$_sec/$pkgname.$_sec"
	done
	install -Dm644 LICENSE-GPL LICENSE-BSD -t "$pkgdir/usr/share/licenses/$pkgname/"
}
