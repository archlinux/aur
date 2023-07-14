# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.17.0
pkgrel=2
_sexpp_version='0.8.4'
url=https://github.com/rnpgp/rnp
license=(custom:BSD)
arch=(i686 x86_64)
makedepends=(cmake pkgconf asciidoctor)
depends=(botan2 bzip2 json-c)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "sexpp-$_sexpp_version.tar.gz::https://github.com/rnpgp/sexpp/archive/refs/tags/v$_sexpp_version.tar.gz")
b2sums=('9a6ea0452f067464ef52cef395c2969ba9912c5ed32ac6f4d860a3410965dbfbb1ad5c0d4f25489011d869222a4362a90463f521efe5af4b7c412f0ed1e4570b'
        'f79890885d9708315d90fdad4f4b37be29e0c2fdcf36d0b63eab18acb2075dcd03614f269514961609c02e4889851bae9ddbe16fcb33d6fa442481863f0ed6b5')

prepare ()
{
	rm -vrf "$pkgname-$pkgver/src/libsexp"
	ln -vsnf "$srcdir/sexpp-$_sexpp_version" "$pkgname-$pkgver/src/libsexp"
}

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
