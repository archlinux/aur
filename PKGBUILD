# Maintainer: Blair Noctis <ncts@nightsail.net>
pkgname=wireman
pkgver=0.2.5
pkgrel=1
pkgdesc='A gRPC client for the terminal'
arch=('x86_64')
url='https://preiter93.github.io/wireman/'
license=('MIT')
makedepends=('rust' 'mold')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/preiter93/wireman/archive/refs/tags/v${pkgver}.tar.gz"
        ${pkgname}.fish)
sha256sums=('4b8159fa86b93f71cf84e53a6ecb47d7695cf4de2427cbc20dc5fa10f754aa1c'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	RUSTFLAGS=-Clink-arg=-fuse-ld=mold cargo build --release --locked
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	RUSTFLAGS=-Clink-arg=-fuse-ld=mold cargo test --release --locked
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	bin="$pkgdir/usr/bin"
	fish_comp="$pkgdir/usr/share/fish/vendor_completions.d/"
	mkdir -p "$bin" "$fish_comp"
	# cargo install seems to install some unwanted hidden files.
	install -m755 target/release/$pkgname "$bin/"
	install -m755 ../${pkgname}.fish "$fish_comp/"
}
