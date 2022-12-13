# Maintainer: Paul van der Linden <mail@paultjuh.org>
# Contributor: Oliver Gatti
# Contributor: Andrew Titmuss <andrew@coffeetocode.me>

pkgname=scangearmp2
pkgver=4.50
pkgrel=1
pkgdesc="Canon ScanGear MP v2 scanner driver."
arch=('i686' 'x86_64')
url="https://www.canon.co.uk"
license=('GPL' 'custom:canon')
depends=('gtk2' 'libusb')

provides=('scangearmp2')

source=("https://gdlp01.c-wss.com/gds/2/0100011642/01/scangearmp2-source-4.50-1.tar.gz" \
	scangearmp2.desktop libusb.patch)
sha256sums=('74601c5fd4869a520df6d3a6f4e9ec61f16452c60f4e331f076c3f251d860fff'
            'd9b449d6c78c92f296acef85209b30c7d80b8bac692f135d071730ef0051d64b'
            'ea64d40b4537a79a400a217a90b8fcdf9589e93df9710bb6a353bce54149879e')

[[ "$CARCH" == "x86_64" ]] && _arch="x86_64" || _arch="i686"

prepare() {
	cd "$pkgname-source-$pkgver-$pkgrel"
	patch -p2 < ../libusb.patch
}

build() {
	cd "$pkgname-source-$pkgver-$pkgrel"
	echo $_arch
	pushd "scangearmp2"
	./autogen.sh --prefix=/usr \
		     --enable-libpath=/usr/lib \
		     LDFLAGS="-L../../com/libs_bin_$_arch"
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

	install -sm755 com/libs_bin_$_arch/*.so.* "$pkgdir/usr/lib"
	cp -P com/libs_bin_$_arch/*.so "$pkgdir/usr/lib"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

	install -m644 "doc/LICENSE-scangearmp-${pkgver}EN.txt" "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "doc/LICENSE-scangearmp-${pkgver}FR.txt" "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "doc/LICENSE-scangearmp-${pkgver}JP.txt" "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "doc/LICENSE-scangearmp-${pkgver}SC.txt" "$pkgdir/usr/share/licenses/$pkgname"

	mkdir -p "$pkgdir/etc/udev/rules.d"
	install -m644 scangearmp2/etc/*.rules "$pkgdir/etc/udev/rules.d"

	pushd "scangearmp2"
	make DESTDIR="$pkgdir/" install
	popd
}
