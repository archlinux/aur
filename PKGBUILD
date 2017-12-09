pkgname=drpm
pkgver=0.3.0
pkgrel=2
pkgdesc="A small library for fetching information from deltarpm packages"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('BSD' 'LGPL3')
depends=('bzip2' 'openssl' 'rpm-org' 'xz' 'zlib')
makedepends=('cmake' 'doxygen')
checkdepends=('cmocka')
md5sums=('e1ca38e14f52d0f5229bba45ba8b8904')
source=("http://pkgs.fedoraproject.org/repo/pkgs/$pkgname/$pkgname-$pkgver.tar.bz2/${md5sums[0]}/$pkgname-$pkgver.tar.bz2")

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DINCLUDE_INSTALL_DIR=/usr/include \
	      -DLIB_INSTALL_DIR=/usr/lib \
	      ..

	make
	make doc
}

check() {
	cd "$pkgname-$pkgver"/build
	make ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir"/usr/share/doc/$pkgname
	cp -Rp doc/html "$pkgdir"/usr/share/doc/$pkgname/html

	install -Dp -m644 ../LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
}

# vim: set ft=sh ts=4 sw=4 noet:
