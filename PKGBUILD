# Maintainer: j.r <j.r@jugendhacker.de>
# Contributor: Felix Serrano Blanco <felixseblanc@gmail.com>

pkgname=libtd
pkgver=1.7.0
pkgrel=3
pkgdesc="Cross-platform library for building Telegram clients "
arch=('x86_64')
url='https://core.telegram.org/tdlib'
license=('Boost')
depends=(
	'openssl'
	'zlib'
	'gcc-libs'
)
makedepends=(
	'git'
	'clang>=3.4'
	'cmake>=3.0.2'
	'gperf'
	'php'
)
provides=('libtd')
conflicts=('telegram-tdlib')
source=("$pkgname::git+https://github.com/tdlib/td.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	rm -rf build
	mkdir build
	cd build
	CC=/usr/bin/clang
	CXX=/usr/bin/clang++
	cmake -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
	cmake --build . --target prepare_cross_compiling
	cd ..
	php SplitSource.php
}

package() {
	cd "$srcdir/$pkgname/build"
	mkdir -p "$pkgdir/usr"
	cmake --build . --target install
}
