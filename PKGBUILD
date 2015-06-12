# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=mobac-svn
pkgver=2021
pkgrel=1
pkgdesc="application that creates atlases for the J2ME application TrekBuddy"
arch=('i686' 'x86_64')
url="http://mobac.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant' 'sed' 'subversion' 'java-environment')
source=('mobac.desktop' 'directories.ini')
md5sums=('78a831bdc101f859138700f7e61ff148'
         'eacac8afe131dda257e5d3dfff6c6ac5')

provides=('mobac')
conflicts=('mobac')

_svntrunk="http://svn.code.sf.net/p/mobac/code/trunk/"
_svnmod="mobac"

build() {
	cd $srcdir/

	# get the sources
	msg "Connecting to $_svntrunk ..."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up) || return 1
	else
		svn co $_svntrunk $_svnmod || return 1
	fi
	msg "SVN checkout done or server timeout"

	cd $_svnmod

	cd $srcdir/mobac/MOBAC
	ant || /usr/share/java/apache-ant/bin/ant
}

package() {
	cd $srcdir/mobac/MOBAC
	mkdir -p $pkgdir/usr/share/mobac/mapsources
	install -Dm 644 ./Mobile_Atlas_Creator.jar $pkgdir/usr/share/mobac/Mobile_Atlas_Creator.jar
	install -Dm 644 ./README.HTM $pkgdir/usr/share/mobac/README.html
	install -Dm 644 ./CHANGELOG.txt $pkgdir/usr/share/mobac/CHANGELOG.txt
	install -Dm 644 ./gpl.txt $pkgdir/usr/share/mobac/gpl.txt
	# we need to supply the full path to starting script
	/usr/bin/sed "s/Mobile_Atlas_Creator.jar/\/usr\/share\/mobac\/Mobile_Atlas_Creator.jar/" ./start.sh >./mobac
	install -Dm 755 ./mobac $pkgdir/usr/bin/mobac
	install -Dm 644 ../website/images/logo3.png $pkgdir/usr/share/pixmaps/mobac.png
	install -Dm 644 $srcdir/mobac.desktop $pkgdir/usr/share/applications/mobac.desktop
	install -Dm 644 $srcdir/directories.ini $pkgdir/usr/share/mobac/directories.ini
	find $srcdir/mobac/MOBAC/mapsources -maxdepth 1 -type f -name "*jar" -exec cp '{}' $pkgdir/usr/share/mobac/mapsources \;
}
