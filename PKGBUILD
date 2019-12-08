# Maintainer: Oliver Gatti
# Contributor: Andrew Titmuss <andrew@coffeetocode.me>

pkgname=scangearmp2
pkgver=3.90
pkgrel=1
pkgdesc="Canon ScanGear MP v2 scanner driver."
arch=('i686' 'x86_64')
url="https://www.canon.co.uk"
license=('GPL' 'custom:canon')
depends=('gtk2' 'libusb')

provides=('scangearmp2')

source=("http://gdlp01.c-wss.com/gds/7/0100010487/01/scangearmp2-source-3.90-1.tar.gz" \
	scangearmp2.desktop)
sha256sums=('eda14ffe3110bf329a50b00a5546f353e5daa5ee5d3dffd442ddfaf9c280d682'
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
