# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.17.1
pkgrel=1
_sexpp_version='0.8.7'
url=https://github.com/rnpgp/rnp
license=('BSD-2-Clause AND BSD-3-Clause AND Apache-2.0 AND MIT')
arch=(i686 x86_64)
makedepends=(cmake pkgconf asciidoctor)
depends=(botan bzip2 gcc-libs glibc json-c zlib)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "sexpp-$_sexpp_version.tar.gz::https://github.com/rnpgp/sexpp/archive/refs/tags/v$_sexpp_version.tar.gz")
b2sums=('279cd5c669b469112066c4754a9a5a5c9fbe3ba225be4f85bc507aad9f29cfa166f90cb3dfe83ea8e29964fdfbbf926438fb36bb345da494ed7f70586fa8d7b6'
        '1b7d45f00769b54c152c25e3befe73db628b8db880ed8b14cc3e1b4c07f90859d2994cbc3a03cad7dfdcc2a20ec4df4263bd04b17ef27f1d3a96e46e6d214923')

prepare ()
{
	cp -a "sexpp-$_sexpp_version"/* "$pkgname-$pkgver/src/libsexpp/"
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
