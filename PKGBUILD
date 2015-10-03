# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=zelvici-svn
pkgver=r26
pkgrel=1
pkgdesc="2D arcade game featuring lovely turtle (svn version)"
arch=('i686')
url="http://code.google.com/p/zelvici/"
license=('GPL-2')
depends=('gcc-libs' 'sdl_mixer')
makedepends=('subversion')
source=("zelvici-read-only::svn+http://zelvici.googlecode.com/svn/trunk/" "http://zelvici.googlecode.com/files/zelvici_i386.tar.gz" "zelvici.desktop")
md5sums=('SKIP'
         'a4c9718f21b9824595ba973d981dd135'
         '23cde56b0478965c568e1b9713f1d6c7')

pkgver() {
  cd "zelvici-read-only"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
	cd $srcdir/zelvici-read-only
	/usr/bin/make
	chmod -R a+r *
}

package() {
	mkdir -p $pkgdir/usr/share/zelvici $pkgdir/usr/bin
	cd $srcdir/zelvici-read-only
	/bin/tar cf - */ config.conf --exclude=zelvici.sdl | ( cd ../../pkg/$pkgname/usr/share/zelvici; tar xfp - )
	install -Dm 755 $srcdir/zelvici-read-only/zelvici $pkgdir/usr/share/zelvici/zelvici
	install -Dm 644 $srcdir/zelvici.desktop $pkgdir/usr/share/applications/zelvici.desktop

        echo "#!/bin/sh
cd /usr/share/zelvici
./zelvici \"\$@\"" > $pkgdir/usr/bin/zelvici
        chmod 755 $pkgdir/usr/bin/zelvici
}
