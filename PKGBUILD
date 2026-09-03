# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.18.1
pkgrel=2
url=https://github.com/rnpgp/rnp
license=('BSD-2-Clause AND BSD-3-Clause AND Apache-2.0 AND MIT')
arch=(i686 x86_64)
makedepends=(cmake pkgconf asciidoctor)
depends=(botan bzip2 gcc-libs glibc json-c zlib)
source=("$url/releases/download/v$pkgver/rnp-v$pkgver.tar.gz"
        fix-cstring-include-ba8df120afc88b9530df3a1c6a249032932466c7.patch)
b2sums=('806e421e204f5b635c870a3a9bed2006a05181eb7134b636be0aa31813d73bdf90dba1980264bffa754b7656437982d197522c0bf7684830aa1776977fdfe195'
        'e9f4c98bb67f7be46ca199485ab5e9cc53362cada8ee7bb84209ca6dfe0bea560ce469857b1261a1dca146b0d5012cbbff07f0b6f6b64b90b36a45753a4a8ddf')

prepare () {
	cd "$pkgname-v$pkgver"
	patch -p1 -i "$srcdir/fix-cstring-include-ba8df120afc88b9530df3a1c6a249032932466c7.patch"
}

build ()
{
	cmake -S"$pkgname-v$pkgver" -Bbuild \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DENABLE_SANITIZERS=OFF \
		-DENABLE_COVERAGE=OFF \
		-DENABLE_FUZZERS=OFF \
		-DBUILD_TESTING=OFF \
		-DDOWNLOAD_GTEST=OFF \
		-DBUILD_SHARED_LIBS=ON
	cmake --build build
}

package ()
{
	DESTDIR="$pkgdir" cmake --build build --target install
	cd "$pkgname-v$pkgver"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" \
		README.adoc LICENSE.md LICENSE-OCB.md
}
