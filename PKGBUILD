# Maintainer: Oliver Gatti
# Contributor: Andrew Titmuss <andrew@coffeetocode.me>

pkgname=scangearmp2
pkgver=4.10
pkgrel=1
pkgdesc="Canon ScanGear MP v2 scanner driver."
arch=('i686' 'x86_64')
url="https://www.canon.co.uk"
license=('GPL' 'custom:canon')
depends=('gtk2' 'libusb')

provides=('scangearmp2')

source=("http://gdlp01.c-wss.com/gds/4/0100010924/01/scangearmp2-source-4.10-1.tar.gz" \
	scangearmp2.desktop)
sha256sums=('3d208c5bf8bd04b9285f8857ed3272a3371de63df54c31a82cc04158a1b841a4'
            'd9b449d6c78c92f296acef85209b30c7d80b8bac692f135d071730ef0051d64b')

[[ "$CARCH" == "x86_64" ]] && _arch="64" || _arch="32"

prepare() {
	cd "$pkgname-source-$pkgver-$pkgrel"
}

build() {
	cd "$pkgname-source-$pkgver-$pkgrel"

	pushd "scangearmp2"
	./autogen.sh --prefix=/usr \
		     --enable-libpath=/usr/lib \
		     LDFLAGS="-L../../com/libs_bin$_arch"
	make
	popd
}

check() {
	cd "$pkgname-source-$pkgver-$pkgrel"

	pushd "scangearmp2"
	make check
	popd
}

package() {
	mkdir -p "$pkgdir/usr/share/applications"
	install -m755 "scangearmp2.desktop" "$pkgdir/usr/share/applications"

	cd "$pkgname-source-$pkgver-$pkgrel"

	mkdir -p "$pkgdir/usr/lib/bjlib"

	install -m644 "com/ini/canon_mfp2_net.ini" "$pkgdir/usr/lib/bjlib"

	install -sm755 "com/libs_bin$_arch/libcncpmslld2.so.3.0.0" "$pkgdir/usr/lib"
	ln -s "/usr/lib/libcncpmslld2.so.3.0.0" "$pkgdir/usr/lib/libcncpmslld2.so"

	install -sm755 "com/libs_bin$_arch/libcncpnet2.so.1.2.4" "$pkgdir/usr/lib"
	ln -s "/usr/lib/libcncpnet2.so.1.2.4" "$pkgdir/usr/lib/libcncpnet2.so"

	install -sm755 "com/libs_bin$_arch/libcncpnet20.so.1.0.0" "$pkgdir/usr/lib"
	ln -s "/usr/lib/libcncpnet20.so.1.0.0" "$pkgdir/usr/lib/libcncpnet20.so"

	install -sm755 "com/libs_bin$_arch/libcncpnet30.so.1.0.0" "$pkgdir/usr/lib"
	ln -s "/usr/lib/libcncpnet30.so.1.0.0" "$pkgdir/usr/lib/libcncpnet30.so"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

	install -m644 "doc/LICENSE-scangearmp-${pkgver}EN.txt" "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "doc/LICENSE-scangearmp-${pkgver}FR.txt" "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "doc/LICENSE-scangearmp-${pkgver}JP.txt" "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "doc/LICENSE-scangearmp-${pkgver}SC.txt" "$pkgdir/usr/share/licenses/$pkgname"

	mkdir -p "$pkgdir/etc/udev/rules.d"
	install -m644 "scangearmp2/etc/80-canon_mfp2.rules" "$pkgdir/etc/udev/rules.d"

	pushd "scangearmp2"
	make DESTDIR="$pkgdir/" install
	popd
}
