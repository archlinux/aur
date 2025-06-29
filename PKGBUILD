# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.18.0
pkgrel=1
_sexpp_version='0.9.2'
url=https://github.com/rnpgp/rnp
license=('BSD-2-Clause AND BSD-3-Clause AND Apache-2.0 AND MIT')
arch=(i686 x86_64)
makedepends=(cmake pkgconf asciidoctor)
depends=(botan bzip2 gcc-libs glibc json-c zlib)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "sexpp-$_sexpp_version.tar.gz::https://github.com/rnpgp/sexpp/archive/refs/tags/v$_sexpp_version.tar.gz")
b2sums=('db4c3c7f4313e71e3cbcc42727f9de498a472c895476553e4cca9ce4de92129b9c0a1f46583b741b916c492bc0107697636a05451d60738764b0dcc388bbd88e'
        '9a0b06178186b6ee2ea5fd9d2ff80ca1d62ea5e27ba1f99cc01d38f611e1336d672b6130f77d7e149116a1cdad670b0e50c395c25b08af7ab40769ba5f143184')

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
