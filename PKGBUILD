# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.17.0
pkgrel=1
_sexp_version='0.8.3'
url=https://github.com/rnpgp/rnp
license=(custom:BSD)
arch=(i686 x86_64)
makedepends=(cmake pkgconf asciidoctor)
depends=(botan bzip2 json-c)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "sexp-$_sexp_version.tar.gz::https://github.com/rnpgp/sexp/archive/refs/tags/v$_sexp_version.tar.gz"
		sexp-cstdint.patch)
b2sums=('9a6ea0452f067464ef52cef395c2969ba9912c5ed32ac6f4d860a3410965dbfbb1ad5c0d4f25489011d869222a4362a90463f521efe5af4b7c412f0ed1e4570b'
        '9d07c52aa5dc26b8b2f20d3e0ea2ab3bdda3e8fdfe1eca4aea14e49a8acb09f59315ef9b19376ec6c75e552307dcfc62e6a8f4ade37b333b9f7f221d1e835d2c'
        'c3f33e6de88aeb98b18c5c4d0a9f1155c27f5f6289815227c7571516a772b3008e690900913c7e997a71ac446b8da86ff6bca570eb7e79a12c1ad985c8c2e8ae')

prepare ()
{
	rm -vrf "$pkgname-$pkgver/src/libsexp"
	ln -vsnf "$srcdir/sexp-$_sexp_version" "$pkgname-$pkgver/src/libsexp"
	patch -p0 < "$srcdir/sexp-cstdint.patch"
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
