# Maintainer: Romain Reignier <rom.reignier at gmail dot com>

pkgname=serial
pkgver=1.2.1
pkgrel=1
pkgdesc="Cross-platform, Serial Port library written in C++"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://wjwwood.io/serial/"
license=('MIT')
makedepends=('cmake' 'doxygen')
source=("https://github.com/wjwwood/${pkgname}/archive/${pkgver}.tar.gz"
        "catkin.patch"
		"LICENSE.txt")
md5sums=('b6d9ebdf821654715656577652b61b64'
         '49def33e7828e316c1baa66a69f8ba19'
		 'cf59308969fbe23545aa5679666b553b')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i ../catkin.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir build
	cd build
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		..
	make
	cd ..
	make doc
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	cp -a "doc/html" "$pkgdir/usr/share/doc/$pkgname/"

	install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
