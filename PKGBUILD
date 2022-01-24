# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.16.0
pkgrel=1
url=https://github.com/rnpgp/rnp
license=(custom:BSD)
arch=(i686 x86_64)
makedepends=(cmake pkgconf asciidoctor)
depends=(botan bzip2 json-c)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('bdd06b1bd20ae816b54be19fa844767e9978eb387487db85db2dcd699da1d1b426455565a6c0508bf3782e07317d3bf6ae3613ebe6f8721f80849cb985e7850f')

build ()
{
	cmake -S"$pkgname-$pkgver" -Bbuild \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DENABLE_SANITIZERS=OFF \
		-DENABLE_COVERAGE=OFF \
		-DENABLE_FUZZERS=OFF \
		-DBUILD_TESTING=OFF \
		-DDOWNLOAD_GTEST=OFF \
		-DDOWNLOAD_RUBYRNP=OFF \
		-DBUILD_SHARED_LIBS=ON
	cmake --build build
}

package ()
{
	DESTDIR="$pkgdir" cmake --build build --target install
	cd "$pkgname-$pkgver"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" \
		README.adoc LICENSE.md LICENSE-OCB.md
}
