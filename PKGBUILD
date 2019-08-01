# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=spicat
pkgver=0.1.1
pkgrel=1
pkgdesc="full-duplex SPI transactions from the command line"
url="https://github.com/fusion-engineering/spicat"
arch=(x86_64 i686 aarch64)

source=("$pkgname-$pkgver.tar.gz::https://github.com/fusion-engineering/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('014d8f3fafe9f3d6c191ddf1aecf9382f8d709c507ac29cbc594db8939d377f837d59e07f95bdd5896be37968e27b721017934d8d8befe4d9ea2d60506568b32')

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
