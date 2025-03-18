# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Andrey Semisokhin <customs.rnd@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=gpredict-git
_pkgname=gpredict
pkgver=2.3.r133.g91a4a3f
#.r133.g91a4a3f
pkgrel=2
pkgdesc="Gpredict is a real-time satellite tracking and orbit prediction application."
arch=('i686' 'x86_64')
url="http://gpredict.oz9aec.net/"
license=('GPL-2.0-only')
depends=('curl>=7.19' 'goocanvas2' 'hamradio-menus')
makedepends=('git' 'autoconf' 'automake' 'intltool')
optdepends=('hamlib: rig interfacing/control'
	    'libreoffice: read /usr/share/doc/gpredict/um/gredict-user-manual.odt')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("$_pkgname::git+https://github.com/csete/$_pkgname.git#tag=master")

pkgver() {
	cd $_pkgname

	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$_pkgname

	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd $srcdir/$_pkgname

#	make check
#	make -k check
	make -i check
}
	
package()
{
	cd $srcdir/$_pkgname

	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/share/doc/${_pkgname}/{notes,um}
	install -m644 doc/notes/* $pkgdir/usr/share/doc/${_pkgname}/notes/.
	install -m644 doc/um/* $pkgdir/usr/share/doc/${_pkgname}/um/.

	rm -rf $pkgdir/usr/share/${_pkgname}/COPYING
	sed -i '$ a\X-DCOP-ServiceType=none' $pkgdir/usr/share/applications/${_pkgname}.desktop
	sed -i '$ a\X-KDE-SubstituteUID=false' $pkgdir/usr/share/applications/${_pkgname}.desktop
}
md5sums=('SKIP')
