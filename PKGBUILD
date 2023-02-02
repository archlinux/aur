# Maintainer: j.r <j.r@jugendhacker.de>
# Contributor: Daniil Kovalev <daniil@kovalev.website>
# Contributor: Felix Serrano Blanco <felixseblanc@gmail.com>

pkgname=libtd
pkgver=1.8.10
pkgrel=1
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
_commit=93c42f6d7c1209937431469f80427d48907f1b8d
source=("$pkgname::git+https://github.com/tdlib/td.git#commit=$_commit")
md5sums=('SKIP')

build() {
	cd "$srcdir"
	CC=/usr/bin/clang
	CXX=/usr/bin/clang++
	cmake -B build -S "$pkgname" -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" -Wno-dev
	cmake --build build --target prepare_cross_compiling
	cd "$pkgname"
	php SplitSource.php
	cd ..
	cmake --build build --target all
}

package() {
	cd "$srcdir"
	cmake --build build --target install
}
