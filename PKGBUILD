# Maintainer: Blair Noctis <ncts@nightsail.net>
pkgname=heretek
pkgver=0.4.0
pkgrel=1
pkgdesc='Yet Another GDB TUI Frontend'
arch=('x86_64')
url='https://github.com/wcampbell0x2a/heretek'
license=('Apache-2.0 OR MIT')
depends=('gdb')
makedepends=('rust' 'mold' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wcampbell0x2a/heretek/archive/refs/tags/v${pkgver}.tar.gz"
        ${pkgname}.fish)
sha256sums=('bdd24c83530d276e2c79e546813099cf9a473e6eff65c595e73d12975cf4ab63'
            'f96f17efd5fa2bcbc585661001426c367cf3d2a4e52f8cf6ac1e53ee21c2d1f4')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo fetch --locked
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	RUSTFLAGS='-Clink-arg=-fuse-ld=mold' cargo build --release --locked
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	RUSTFLAGS='-Clink-arg=-fuse-ld=mold' cargo test --release --locked
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	bin="$pkgdir/usr/bin"
	fish_comp="$pkgdir/usr/share/fish/vendor_completions.d/"
	mkdir -p "$bin" "$fish_comp"
	# cargo install seems to install some unwanted hidden files.
	install -m755 target/release/heretek "$bin/"
	install -m755 $srcdir/heretek.fish "$fish_comp/"
}
