# Maintainer: éclairevoyant

pkgname=wayshot
pkgver=1.2.2
pkgrel=1
pkgdesc="Screenshot tool for wlroots compositors"
arch=(x86_64)
url="https://git.sr.ht/~shinyzenith/$pkgname"
license=(BSD)
optdepends=('slurp: for area selection')
makedepends=(cargo git scdoc)
source=("git+$url#commit=31baff5229bc8f5bd835b1b7b649513b437dfe5e?signed")
b2sums=('SKIP')
validpgpkeys=('C18E2B48B8DA9B624C8B72D66DD485917B553B7B') # Shinyzenith#6969 (gpgkeypair) <aakashsensharma@gmail.com>

prepare() {
	cd $pkgname

	# don't waste time zipping manpages
	rm -rfv build.rs

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build(){
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
