pkgname=drpm
pkgver=0.3.0
pkgrel=1
pkgdesc="A small library for fetching information from deltarpm packages"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/$pkgname/"
license=('LGPL3')
depends=('bzip2' 'openssl' 'rpm-org' 'xz' 'zlib')
makedepends=('cmake' 'doxygen')
checkdepends=('cmocka')
source=("https://fedorahosted.org/released/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('e1ca38e14f52d0f5229bba45ba8b8904')

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

	install -d "$pkgdir"/usr/share/doc/$pkgname
	cp -a doc/html "$pkgdir"/usr/share/doc/$pkgname/html
}

# vim: set ft=sh ts=4 sw=4 noet:
