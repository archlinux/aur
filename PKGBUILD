# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=cfspeedtest
pkgver=1.2.4
pkgrel=1
pkgdesc="Unofficial CLI for speed.cloudflare.com"
arch=('x86_64')
url="https://github.com/code-inflation/cfspeedtest"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('b5ccb2fe2c0693f5b848f9fd3ab01834d4bec1aa97427c8e1ed777a84745fd21')

prepare() {
	cd "$srcdir/$pkgname"
    	export RUSTUP_TOOLCHAIN=stable
    	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
    	cargo build --frozen --release --target-dir target
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$srcdir/$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
