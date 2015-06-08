# Maintainer: Alan Witkowski <alan.witkowski+aur@gmail.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Ray Rashif <rayrashif@gmail.com>
# Contributor: Ronan RABOUIN <darkbaboon@gmail.com>
pkgname=irrlamb
pkgver=0.1.1
pkgrel=2
pkgdesc="3D game involving physics & frustrating gameplay"
arch=('i686' 'x86_64')
url="http://code.google.com/p/irrlamb/"
license=('GPL3')
depends=('bullet' 'gcc-libs' 'irrlicht' 'lua51' 'openal' 'sh')
makedepends=('cmake')
changelog=Changelog
source=("http://irrlamb.googlecode.com/files/$pkgname-$pkgver-src.tar.gz")
sha256sums=('2fbb30ee6cd0c65fc84acf6d260da468f0a1663af6f019ec4baf8177980ab96b')

prepare() {
	cd $srcdir/$pkgname-$pkgver-src

	# linking fix
	sed -i 's/${OPENAL_LIBRARY}/${OPENAL_LIBRARY} ${CMAKE_THREAD_LIBS_INIT} ${CMAKE_DL_LIBS}/' CMakeLists.txt
	sed -r -i 's/find_package\(Bullet REQUIRED\)/find_package(Bullet REQUIRED)\nfind_package(Threads REQUIRED)/' CMakeLists.txt

	# script fix
	sed -i 's|/local||' deployment/irrlamb
}

build() {
	cd $srcdir/$pkgname-$pkgver-src
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver-src

	make DESTDIR=$pkgdir install

	# it's a standard license, rm it
	rm $pkgdir/usr/share/doc/$pkgname/license.txt

	# place starting script where it's supposed to be
	install -dm755 $pkgdir/usr/bin
	mv $pkgdir/usr/games/$pkgname $pkgdir/usr/bin/$pkgname
	rmdir $pkgdir/usr/games
}

