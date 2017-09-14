# Maintainer: Haruka Ma <haruka@tsundere.moe>
pkgname="animeloop-cli"
pkgver=2.0.0
pkgrel=1
pkgdesc="Anime loop video command line tool."
arch=('i686' 'x86_64')
url="https://animeloop.org"
license=('MIT')
depends=("opencv>=3.2" "openssl" "boost" "ffmpeg" "hdf5")
makedepends=("cmake")
source=("$pkgname-$pkgver+1.tar.gz::https://github.com/moeoverflow/animeloop-cli/archive/3bb4c748f622687a7ecbfe0017b02f5807f52b9b.tar.gz"
        "cxxopts.tar.gz::https://github.com/jarro2783/cxxopts/archive/9db62cb338aeaed1fec5806f6b5d9781f5e19e4c.tar.gz"
        "jsoncpp.tar.gz::https://github.com/open-source-parsers/jsoncpp/archive/d7347a2623707d71f8b21b18a46a1281ab79d45c.tar.gz")
noextract=("cxxopts.tar.gz" "jsoncpp.tar.gz")
md5sums=("28df805fb7bc6e9b4f607f08af5e604e"
         "603960b79c68476197018e7bcb3e7b9c"
         "7cc130d63571b2fb7e681d0f16197d7d")

prepare() {
	cd "$pkgname-3bb4c748f622687a7ecbfe0017b02f5807f52b9b"
	cd cxxopts
	tar xf ../../cxxopts.tar.gz --strip-components=1
	cd ../jsoncpp
	tar xf ../../jsoncpp.tar.gz --strip-components=1
	python amalgamate.py
}	

build() {
	cd "$pkgname-3bb4c748f622687a7ecbfe0017b02f5807f52b9b"
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-3bb4c748f622687a7ecbfe0017b02f5807f52b9b"
	cd build
	make DESTDIR="$pkgdir/" install
	mkdir "$pkgdir/usr/bin"
	cp animeloop-cli color cuts-switch similar-and-same "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/licenses/animeloop-cli"
	cp ../LICENSE "$pkgdir/usr/share/licenses/animeloop-cli/"
}
