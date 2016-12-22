# Maintainer: Andrew Titmuss <andrew@coffeetocode.me>
pkgname=scangearmp2
pkgver=3.20
pkgrel=1
pkgdesc="Canon ScanGear MP for Linux"
arch=('i686' 'x86_64')
url="https://www.canon.com.au/home-printers"
license=('GPL' 'custom:canon')
depends=('gtk2' 'libusb')
provides=('scangearmp2')
source=("http://gdlp01.c-wss.com/gds/3/0100006903/01/$pkgname-source-$pkgver-$pkgrel.tar.gz")
md5sums=('8a7d6e60af22b749508419b0e79e8066')

[[ "$CARCH" == "x86_64" ]] && _arch="64" || _arch="32"

build() {
	cd "$pkgname-source-$pkgver-$pkgrel"

	pushd scangearmp2
	./autogen.sh --prefix=/usr \
		     --enable-libpath=/usr/lib/bjlib2 \
		     LDFLAGS="-L../../com/libs_bin$_arch"
	make
	popd
}

check() {
	cd "$pkgname-source-$pkgver-$pkgrel"

	pushd scangearmp2
	make check
	popd
}

package() {
	mkdir -p "$pkgdir/usr/lib/bjlib2"
	mkdir -p "$pkgdir/usr/bin"

	cd "$pkgname-source-$pkgver-$pkgrel"

	install -m644 com/ini/canon_mfp2_net.ini "$pkgdir/usr/lib/bjlib2"
	install -sm755 com/libs_bin$_arch/*.so.* "$pkgdir/usr/lib"
	install -Dm644 doc/LICENSE-scangearmp-${pkgver}EN.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	pushd scangearmp2
	make DESTDIR="$pkgdir/" install
	popd
}
