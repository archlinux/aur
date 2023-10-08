# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=spicat
pkgver=0.1.4
pkgrel=1
pkgdesc="full-duplex SPI transactions from the command line"
url="https://github.com/fusion-engineering/spicat"
arch=(x86_64 i686 aarch64)

source=("$pkgname-$pkgver.tar.gz::https://github.com/fusion-engineering/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('458a1dfc14ced0b968bb3fbe85ee3977deae135ac0c6f2768165496a3ff8d82e8e2f198fc67fa7c55b1e176b5858a50bee5b5d6fb5e81ceebb2e3af7768d7b23')

license=(BSD)

makedepends=(cargo)

_target="$CARCH-unknown-linux-gnu"

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --target="$_target" --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# Install binaries.
	for file in "target/$_target/release"/*; do
		name="$(basename "$file")"
		[[ -f "$file" && -x "$file" ]] || continue
		install -Dt "$pkgdir/usr/bin/" -m755 "$file"
	done

	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" -m644 "LICENSE"
}
