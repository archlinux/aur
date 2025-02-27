# Maintainer: Blair Noctis <ncts@nightsail.net>
pkgname=heretek
pkgver=0.5.0
pkgrel=2
pkgdesc='Yet Another GDB TUI Frontend'
arch=('x86_64')
url='https://github.com/wcampbell0x2a/heretek'
license=('Apache-2.0 OR MIT')
depends=('gdb')
makedepends=('rust' 'mold' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wcampbell0x2a/heretek/archive/refs/tags/v${pkgver}.tar.gz"
        ${pkgname}.fish)
sha256sums=('36684533a39b2b9f3d0e292efa8fcb385603bdcd5ddc9038365280e4f0708a53'
            '27a10d33e845830df96a9c5041e05a1ee8500c9ab42f27c24a760e1365dba002')

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
