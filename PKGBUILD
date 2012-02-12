# Maintainer:  Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kraft-svn
pkgver=1255047
pkgrel=1
pkgdesc="A program suitable for all trades or crafts"
arch=('i686' 'x86_64')
url="http://kraft.sourceforge.net/index.php?lang=en"
license=('GPL')
depends=('kdepimlibs' 'ctemplate' 'python-reportlab')
provides=('kraft')
conflicts=('kraft')

makedepends=('cmake' 'automoc4' 'boost' 'subversion')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/office/kraft
_svnmod=kraft

build() {

	cd ${srcdir}
	msg "Connecting to $_svntrunk SVN server...."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver )
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf $_svnmod-build
	cp -r $_svnmod $_svnmod-build
	cd ${srcdir}/$_svnmod-build

	mkdir -p build
	cd build
	cmake ../ \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr

	# fix /usr/bin/python being python2
	sed -i 's/python/python2/' ../tools/erml2pdf.py
	# (fatal)
	sed -i 's/"python"/"python2"/' ../src/reportgenerator.cpp

	# fix wrong exception raising (nonfatal)
	sed -i 's/raise ValueError, "Not enough space"/raise ValueError("Not enough space")/' ../tools/erml2pdf.py

	make

}

package() {
	cd ${srcdir}/${_svnmod}-build/build
	make DESTDIR=${pkgdir} install
}
