# Maintainer: Jonathan Schleifer <js@nil.im>
pkgname=('libobjfw' 'libobjfwrt' 'libobjfwtls' 'ofarc' 'ofdns' 'ofhash' 'ofhttp')
pkgbase=objfw
pkgver=1.0.12
pkgrel=1
pkgdesc="Portable, lightweight framework for the Objective-C language"
arch=('x86_64')
url="https://objfw.nil.im/"
license=('custom:QPL' 'GPL3' 'GPL2')
groups=(objfw)
makedepends=(clang)
source=("$pkgbase-$pkgver.tar.gz::https://objfw.nil.im/downloads/$pkgbase-$pkgver.tar.gz")
sha256sums=(d5f9d5dcb95c52f7b243b1b818a34be99cecaaa5afd6de1c5b2502214f5df7f7)

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

	for i in LICENSE.QPL LICENSE.GPLv3 LICENSE.GPLv2; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done

	# Those are in subpackages
	rm -f "$pkgdir/usr/bin/ofarc"
	rm -f "$pkgdir/usr/bin/ofdns"
	rm -f "$pkgdir/usr/bin/ofhash"
	rm -f "$pkgdir/usr/bin/ofhttp"
	rm -fr "$pkgdir/usr/include/ObjFWRT"
	rm -fr "$pkgdir/usr/include/ObjFWTLS"
	rm -f "$pkgdir/usr/lib/libobjfwrt.so"*
	rm -f "$pkgdir/usr/lib/libobjfwtls.so"*
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

	for i in LICENSE.QPL LICENSE.GPLv3 LICENSE.GPLv2; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}

package_libobjfwtls() {
	pkgdesc="TLS support for ObjFW"
	depends=(glibc gcc-libs libobjfw libobjfwrt openssl)

	cd "$pkgbase-$pkgver"
	make -C src/tls DESTDIR="$pkgdir/" install

	for i in LICENSE.QPL LICENSE.GPLv3 LICENSE.GPLv2; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}

package_ofarc() {
	pkgdesc="Utility for handling ZIP, Tar and LHA archives"
	depends=(glibc gcc-libs libobjfw libobjfwrt)

	cd "$pkgbase-$pkgver"
	make -C utils/ofarc DESTDIR="$pkgdir/" install

	for i in LICENSE.QPL LICENSE.GPLv3 LICENSE.GPLv2; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}

package_ofdns() {
	pkgdesc="Utility for performing DNS requests on the command line"
	depends=(glibc gcc-libs libobjfw libobjfwrt)

	cd "$pkgbase-$pkgver"
	make -C utils/ofdns DESTDIR="$pkgdir/" install

	for i in LICENSE.QPL LICENSE.GPLv3 LICENSE.GPLv2; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}

package_ofhash() {
	pkgdesc="Utility to hash files with various cryptographic hash functions"
	depends=(glibc gcc-libs libobjfw libobjfwrt)

	cd "$pkgbase-$pkgver"
	make -C utils/ofhash DESTDIR="$pkgdir/" install

	for i in LICENSE.QPL LICENSE.GPLv3 LICENSE.GPLv2; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}

package_ofhttp() {
	pkgdesc="Command line downloader for HTTP(S)"
	depends=(glibc gcc-libs libobjfw libobjfwrt libobjfwtls)

	cd "$pkgbase-$pkgver"
	make -C utils/ofhttp DESTDIR="$pkgdir/" install

	for i in LICENSE.QPL LICENSE.GPLv3 LICENSE.GPLv2; do
		install -D -m 644 "$i" "$pkgdir/usr/share/licenses/$pkgname/$i"
	done
}
