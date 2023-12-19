# Maintainer: éclairevoyant

pkgname=wayshot
pkgver=1.3.1
pkgrel=2
pkgdesc="Screenshot tool for wlroots compositors"
arch=(x86_64)
url="https://github.com/waycrate/$pkgname"
license=(BSD)
depends=(gcc-libs glibc)
optdepends=('slurp: for area selection')
makedepends=(cargo git scdoc)
source=("git+$url#commit=d3cdd329fe8263d5eca2ff62635fcb6b6ae57645?signed")
b2sums=('SKIP')
validpgpkeys=('C18E2B48B8DA9B624C8B72D66DD485917B553B7B') # Shinyzenith#6969 (gpgkeypair) <aakashsensharma@gmail.com>

prepare() {
	cd $pkgname

	# don't waste time zipping manpages
	rm -rfv build.rs

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
	install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 docs/$pkgname.1.scd "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 docs/$pkgname.7.scd "$pkgdir/usr/share/man/man7/$pkgname.7"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
