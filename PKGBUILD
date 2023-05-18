pkgname=drpm
pkgver=0.5.2
pkgrel=1
pkgdesc="A small library for fetching information from deltarpm packages"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1' 'custom:BSD')
depends=('bzip2' 'openssl' 'rpm-tools' 'xz' 'zlib' 'zstd')
makedepends=('cmake>=3.13' 'doxygen')
checkdepends=('cmocka')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('33767a4029f707ac974cbbc6cdf02d12a8574a9647eb1b7c2424195e1784f054')

build() {
	cd "$pkgname-$pkgver"

	cmake -B build \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DWITH_ZSTD=ON

	cmake --build build
	cmake --build build --target doc
}

check() {
	cd "$pkgname-$pkgver"

	ctest --test-dir build --output-on-failure
}

package() {
	cd "$pkgname-$pkgver"

	DESTDIR="$pkgdir" cmake --install build

	mkdir -p "$pkgdir"/usr/share/doc/$pkgname
	cp -Rp build/doc/html "$pkgdir"/usr/share/doc/$pkgname/html

	install -Dp -m644 LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
}

# vim: set ft=sh ts=4 sw=4 noet:
