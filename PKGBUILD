# Contributor: Jozef Riha <jose1711 at gmail dot com>

pkgname=xmltvproducer-svn
pkgver=36
pkgrel=1
pkgdesc="a php engine to grab tv/radio listings from websites and produce XMLTV output"
arch=('i686' 'x86_64')
url="http://xmltvproducer.sourceforge.net/"
license=('LGPL')
depends=('php')
install=('xmltvproducer.install')
source=()
md5sums=()

_svntrunk="https://xmltvproducer.svn.sourceforge.net/svnroot/xmltvproducer/trunk/xmltvproducer"
_svnmod="xmltvproducer"

build() {

	mkdir -p ${pkgdir}/usr/{share/xmltvproducer/,bin}
	cd $srcdir
	# get the sources
	msg "Connecting to $_svntrunk ..."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up) || return 1
	else
		svn co $_svntrunk $_svnmod || return 1
	fi
	msg "SVN checkout done or server timeout"

	cd $_svnmod

	cd $srcdir/xmltvproducer
	/bin/tar cf - --exclude=.svn * | ( cd ../../pkg/usr/share/xmltvproducer/; tar xfp - )
	echo '#!/bin/sh
cd /usr/share/xmltvproducer/
/usr/bin/php -f ./build.php' > ${pkgdir}/usr/bin/grabxmltv.sh
	chmod 755 ${pkgdir}/usr/bin/grabxmltv.sh
}
