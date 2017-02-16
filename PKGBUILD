# Maintainer: Romain Reignier <rom.reignier at gmail dot com>

pkgname=serial
pkgver=1.2.1
pkgrel=2
pkgdesc="Cross-platform, Serial Port library written in C++"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://wjwwood.io/serial/"
license=('MIT')
makedepends=('cmake' 'doxygen')
source=("https://github.com/wjwwood/${pkgname}/archive/${pkgver}.tar.gz"
        "cmake.patch"
        "serialConfig.cmake"
        "serialConfigVersion.cmake"
		"LICENSE.txt")
md5sums=('b6d9ebdf821654715656577652b61b64'
         '2a78667cd11a34cd24942037161861a5'
         '4d13cd57ee5182a83f3dee5181a83162'
         '8f756a98aad99d2f89d6969e4e6dd7d5'
         'cf59308969fbe23545aa5679666b553b')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i ../cmake.patch
    rm -rf cmake && mkdir cmake
    cp ../serialConfig.cmake cmake/
    cp ../serialConfigVersion.cmake cmake/
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	rm -rf build && mkdir build
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
