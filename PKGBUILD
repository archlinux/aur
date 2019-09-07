# Maintainer: robertfoster

pkgname=ton-node
pkgver=1
pkgrel=1
pkgdesc="Telegram Open Network Full Node and Validator"
arch=('i686' 'x86_64')
url="https://test.ton.org"
license=('LGPL')
depends=('openssl')
makedepends=('cmake' 'gperf')
conflicts=('ton-lite-client')
#install=$pkgname.install
source=("https://test.ton.org/ton-blockchain-full.tar.xz"
"https://test.ton.org/ton-global.config.json")

prepare() {
	if [ ! -d $srcdir/${pkgname}-build ]; then
		mkdir $srcdir/${pkgname}-build
	fi

	touch $srcdir/$pkgname/tonlib/TonlibConfig.cmake
}

build() {
	cd $srcdir/$pkgname-build
	cmake -DCMAKE_INSTALL_PREFIX=/usr --build "$srcdir/${pkgname}"
}

package() {
	cd $srcdir/${pkgname}-build
	make DESTDIR="$pkgdir/" install
	mkdir $pkgdir/usr/bin
	rm -rf CMakeFiles
	for i in $(find . -executable -type f); do
		cp $i $pkgdir/usr/bin/
	done
	rm -rf $pkgdir/usr/bin/libtonlibjson.so.0.5

	install -Dm644 $srcdir/ton-global.config.json $pkgdir/etc/ton-global.config.json
	mkdir -p $pkgdir/var/ton-work/
}

md5sums=('SKIP'
'SKIP')
