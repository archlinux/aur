pkgname=amphetype-svn
pkgver=27
pkgrel=7
pkgdesc="A layout-agnostic typing program aimed at people who don't need an on-screen keyboard"
arch=("i686" "x86_64")
url="http://code.google.com/p/amphetype/"
license=("GPL3")
depends=('python2' 'python2-pyqt4' 'sqlite3')
provides=("amphetype")
conflicts=("amphetype")
source=(amphetype.desktop amphetype.patch)
md5sums=('fa29364a99caa1c68332dc8f65e6df8d'
         'd54433a7a254e1284c93485d48fbbac5')

_svntrunk="http://amphetype.googlecode.com/svn/trunk"
_svnmod="amphetype"

build() {
	cd $srcdir

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	mkdir -p $pkgdir/{usr/share/applications,opt/amphetype,usr/bin}

	cd $_svnmod
	patch -fp0 < $srcdir/amphetype.patch
	chmod +x Amphetype.py

	cp -r * $pkgdir/opt/amphetype
	rm -rf `find $pkgdir -type d -name .svn`
	cp $srcdir/amphetype.desktop $pkgdir/usr/share/applications
	ln -s /opt/amphetype/Amphetype.py $pkgdir/usr/bin/amphetype
}

