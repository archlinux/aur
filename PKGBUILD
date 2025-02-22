# Maintainer: Jonathan Schleifer <js@nil.im>
pkgname=('libobjfw' 'libobjfwrt' 'libobjfwtls' 'libobjfwhid' 'ofarc' 'ofdns'
         'ofhash' 'ofhttp')
pkgbase=objfw
pkgver=1.2.4
pkgrel=1
pkgdesc="Portable, lightweight framework for the Objective-C language"
arch=('x86_64')
url="https://objfw.nil.im/"
license=('LGPL3')
groups=(objfw)
makedepends=(clang)
source=("https://objfw.nil.im/downloads/$pkgbase-$pkgver.tar.gz")
sha256sums=(5d914e2ba6f2f0c8698be1f73752120bf2c7befed72b0f8d18c7957d415a98ab)

build() {
	cd "$pkgbase-$pkgver"
	./configure OBJC=clang --prefix=/usr --with-tls=openssl
	make
}

check() {
	cd "$pkgbase-$pkgver"
	make check
}

package_libobjfw() {
	pkgdesc="ObjFW library"
	depends=(glibc gcc-libs libobjfwrt bash)

	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" install

	for i in COPYING COPYING.LESSER; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done

	# Those are in subpackages
	rm -f "$pkgdir/usr/bin/ofarc"
	rm -f "$pkgdir/usr/bin/ofdns"
	rm -f "$pkgdir/usr/bin/ofhash"
	rm -f "$pkgdir/usr/bin/ofhttp"
	rm -fr "$pkgdir/usr/include/ObjFWHID"
	rm -fr "$pkgdir/usr/include/ObjFWRT"
	rm -fr "$pkgdir/usr/include/ObjFWTLS"
	rm -f "$pkgdir/usr/lib/libobjfwhid.so"*
	rm -f "$pkgdir/usr/lib/libobjfwrt.so"*
	rm -f "$pkgdir/usr/lib/libobjfwtls.so"*
	rm -f "$pkgdir/usr/lib/objfw-config/ObjFWHID.oc"
	rm -f "$pkgdir/usr/lib/objfw-config/ObjFWTLS.oc"
	rm -f "$pkgdir/usr/share/man/man1/ofarc.1"
	rm -f "$pkgdir/usr/share/man/man1/ofdns.1"
	rm -f "$pkgdir/usr/share/man/man1/ofhash.1"
	rm -f "$pkgdir/usr/share/man/man1/ofhttp.1"
	rm -fr "$pkgdir/usr/share/ofarc"
	rm -fr "$pkgdir/usr/share/ofdns"
	rm -fr "$pkgdir/usr/share/ofhash"
	rm -fr "$pkgdir/usr/share/ofhttp"
}

package_libobjfwrt() {
	pkgdesc="ObjFW Objective-C runtime library"
	depends=(glibc gcc-libs)

	cd "$pkgbase-$pkgver"
	make -C src/runtime DESTDIR="$pkgdir/" install

	for i in COPYING COPYING.LESSER; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}

package_libobjfwtls() {
	pkgdesc="TLS support for ObjFW"
	depends=(glibc gcc-libs libobjfw libobjfwrt openssl)

	cd "$pkgbase-$pkgver"
	make -C src/tls DESTDIR="$pkgdir/" install

	for i in COPYING COPYING.LESSER; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}

package_libobjfwhid() {
	pkgdesc="HID support for ObjFW"
	depends=(glibc gcc-libs libobjfw libobjfwrt)

	cd "$pkgbase-$pkgver"
	make -C src/hid DESTDIR="$pkgdir/" install

	for i in COPYING COPYING.LESSER; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}

package_ofarc() {
	pkgdesc="Utility for handling ZIP, Tar, LHA and Zoo archives"
	depends=(glibc gcc-libs libobjfw libobjfwrt)

	cd "$pkgbase-$pkgver"
	make -C utils/ofarc DESTDIR="$pkgdir/" install

	for i in COPYING COPYING.LESSER; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}

package_ofdns() {
	pkgdesc="Utility for performing DNS requests on the command line"
	depends=(glibc gcc-libs libobjfw libobjfwrt)

	cd "$pkgbase-$pkgver"
	make -C utils/ofdns DESTDIR="$pkgdir/" install

	for i in COPYING COPYING.LESSER; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}

package_ofhash() {
	pkgdesc="Utility to hash files with various cryptographic hash functions"
	depends=(glibc gcc-libs libobjfw libobjfwrt)

	cd "$pkgbase-$pkgver"
	make -C utils/ofhash DESTDIR="$pkgdir/" install

	for i in COPYING COPYING.LESSER; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}

package_ofhttp() {
	pkgdesc="Command line downloader for HTTP(S)"
	depends=(glibc gcc-libs libobjfw libobjfwrt libobjfwtls)

	cd "$pkgbase-$pkgver"
	make -C utils/ofhttp DESTDIR="$pkgdir/" install

	for i in COPYING COPYING.LESSER; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}
