# maintainer: hzy068808 at gmail.com
# contributer: a304yuanyuan at gmail.com
# contributer: rob.til.freedman@googlemail.com

pkgname=moonplayer
pkgver=0.71.c11a9d4
pkgrel=1
pkgdesc="A qt font-end for mplayer with the abilities of watching and downloading videos from chinese network"
arch=('i686' 'x86_64')
url="https://github.com/coslyk/moonplayer"
license=('GPL')
depends=('qt5-base' 'python' 'python2' 'mpv' 'you-get')
makedepends=('git')
source=(
	"git+https://github.com/coslyk/moonplayer#commit=c11a9d4d"
	)
sha1sums=('SKIP')

pkgver(){
	cd $srcdir/$pkgname
	echo $(grep "Latest version" README.md | awk '{ print $3 }' | sed 's/^v//g')."$(git describe --always)"
}
build() {
	cd $srcdir/$pkgname/src
#
	find . -name '*.py' -exec sed -i \
	's|#![ ]*/usr/bin/python$|&2|;s|#![ ]*/usr/bin/env python$|&2|' {} +

	qmake-qt5 moonplayer.pro

	make
}

package() {
	cd $srcdir/$pkgname/src

	make INSTALL_ROOT=$pkgdir install

	#clean pyc
	rm $pkgdir/usr/share/moonplayer/plugins/*.pyc

	cd $pkgdir/usr/share

	mv icons pixmaps
}
