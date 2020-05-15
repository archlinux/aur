# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.13.1
pkgrel=1
url=https://github.com/riboseinc/rnp
license=(custom:BSD)
arch=(i686 x86_64)
makedepends=(cmake pkgconf)
depends=(botan zlib bzip2 json-c)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        fix-build.patch)
sha512sums=('5d647ab35ea5458c5e0d8577cc745960baa1747cdca057d6fa64834aca6ff0d887573a0ba01a6e5f16243d7932aca66abdb232f0dbccaef03b894e51b4b6e7a5'
            '406c5c89f93a5e8e2a389e92f8d2490da2fdf120812a033af1b64383d4e7863d53dd8adcbe6f05e30590958c150b9f591b1f249e22b2552962a3ef37c6e7c1fd')

prepare ()
{
	cd "$pkgname-$pkgver"
	patch -p0 < "$srcdir/fix-build.patch"
}

build ()
{
	cmake -S"$pkgname-$pkgver" -Bbuild \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DENABLE_SANITIZERS=OFF \
		-DENABLE_COVERAGE=OFF \
		-DBUILD_TESTING=OFF \
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
