# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=zelvici-svn
pkgver=16
pkgrel=1
pkgdesc="2D arcade game featuring lovely turtle (svn version)"
arch=('i686')
url="http://code.google.com/p/zelvici/"
license=('GPL-2')
depends=('gcc-libs' 'sdl_mixer')
source=("http://zelvici.googlecode.com/files/zelvici_i386.tar.gz" "zelvici.desktop")
md5sums=('a4c9718f21b9824595ba973d981dd135' '23cde56b0478965c568e1b9713f1d6c7')

_svntrunk="http://zelvici.googlecode.com/svn/trunk/"
_svnmod="zelvici-read-only"

build() {
	mkdir -p $pkgdir/usr/{share/zelvici,bin}
	cd $srcdir

	# get the sources
	msg "Connecting to $_svntrunk ..."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up)
	else
		svn co $_svntrunk $_svnmod
	fi
	msg "SVN checkout done or server timeout"

	cd $_svnmod

	cd $srcdir/zelvici-read-only
	/usr/bin/make
	cd $srcdir/zelvici
	chmod -R a+r *
}

package() {
	cd $srcdir/zelvici
	/bin/tar cf - * --exclude=zelvici.sdl | ( cd ../../pkg/usr/share/zelvici/; tar xfp - )
	install -Dm 755 $srcdir/zelvici-read-only/zelvici $pkgdir/usr/share/zelvici/zelvici
	install -Dm 644 $srcdir/zelvici.desktop $pkgdir/usr/share/applications/zelvici.desktop

        echo "#!/bin/sh
cd /usr/share/zelvici
./zelvici \"\$@\"" > $pkgdir/usr/bin/zelvici
        chmod 755 $pkgdir/usr/bin/zelvici
}
