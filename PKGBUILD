# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=spicat
pkgver=0.1.5
pkgrel=1
pkgdesc="full-duplex SPI transactions from the command line"
url="https://github.com/de-vri-es/spicat"
arch=(x86_64 i686 aarch64)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('5dc0c901df148896dc18bbd7e7754348420263a6b1e8b9bfb08dde27b36e841ce8d4d0db3f506e495baa8a6d54fe74f688c78be215cd104d5e3ccece80a22a14')

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
