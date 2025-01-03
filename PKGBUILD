# Maintainer: Blair Noctis <ncts@nightsail.net>
pkgname=heretek
pkgver=0.2.0
pkgrel=2
pkgdesc='Yet Another GDB TUI Frontend'
arch=('x86_64')
url='https://github.com/wcampbell0x2a/heretek'
license=('Apache-2.0 OR MIT')
depends=('gdb')
makedepends=('rust' 'mold' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wcampbell0x2a/heretek/archive/refs/tags/v${pkgver}.tar.gz"
        ${pkgname}.fish
        test-render-app-update-version.patch)
sha256sums=('e60a85d64e447682455d028c7d857415cf56def8d6320f5853e986af8474ca25'
            'f96f17efd5fa2bcbc585661001426c367cf3d2a4e52f8cf6ac1e53ee21c2d1f4'
            'b5a93723dcb7fbf915a8f70f7443fd6481a8809ff388fbdbabf10a57cfb1fac4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	RUSTFLAGS='-Clink-arg=-fuse-ld=mold' cargo build --release --locked
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 < $srcdir/test-render-app-update-version.patch
	RUSTFLAGS='-Clink-arg=-fuse-ld=mold' cargo test --release --locked
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	bin="$pkgdir/usr/bin"
	fish_comp="$pkgdir/usr/share/fish/vendor_completions.d/"
	mkdir -p "$bin" "$fish_comp"
	# cargo install seems to install some unwanted hidden files.
	install -m755 target/release/heretek "$bin/"
	install -m755 ../heretek.fish "$fish_comp/"
}
