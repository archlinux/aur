# Maintainer: éclairevoyant
# Contributor: Wenxuan Zhang <wenxuangm at gmail dot com>

pkgname=csview
pkgver=1.2.4
pkgrel=1
pkgdesc="A high performance csv viewer with cjk/emoji support"
arch=(i686 x86_64)
url="https://github.com/wfxr/$pkgname"
license=(Apache MIT)
depends=(gcc-libs)
makedepends=(cargo git)
source=("git+$url.git?signed#commit=9672456e4660282fac66c1a70e3c564b375427ff")
b2sums=('SKIP')
validpgpkeys=(DC6FB7FC761E848F76E98B4FCCAF35548C65530F) # Wenxuan Zhang <wenxuangm@gmail.com>

prepare() {
	cd $pkgname

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $pkgname

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd $pkgname

	install -Dm755 target/release/$pkgname        -t "$pkgdir/usr/bin/"
	install -Dm644 completions/fish/$pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dm644 completions/zsh/_$pkgname      -t "$pkgdir/usr/share/zsh/site-functions/"
	install -Dm644 README.md                      -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE-{APACHE,MIT}           -t "$pkgdir/usr/share/licenses/$pkgname/"
}
