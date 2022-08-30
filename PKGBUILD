# Maintainer: j.r <j.r@jugendhacker.de>
# Contributor: Felix Serrano Blanco <felixseblanc@gmail.com>

pkgname=libtd
pkgver=1.8.5
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
_commit=d9cfcf88fe4ad06dae1716ce8f66bbeb7f9491d9
source=("$pkgname::git+https://github.com/tdlib/td.git#commit=$_commit")
md5sums=('SKIP')

build() {
	cd "$srcdir"
	CC=/usr/bin/clang
	CXX=/usr/bin/clang++
	cmake -B build -S "$pkgname" -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" -Wno-dev
	make -C build prepare_cross_compiling
	cd "$pkgname"
	php SplitSource.php
	cd ..
	make -C build
}

package() {
	cd "$srcdir"
	make -C build install
}
