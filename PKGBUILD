# Maintainer : robertfoster

pkgname=watchvideo-svn
pkgver=r469
pkgrel=1
pkgdesc="A small application to play, download, rip or convert (to Ogg) videos from popular YouTube-like sites, without the need of the proprietary Flash plugin."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/watchvideo/index.html"
license=('GNU Affero GPL')
depends=('qt4' 'python2' 'python2-lxml' 'python2-simplejson' 'mplayer' 'python2-pyqt4' 'mediainfo' 'python2-getmediumurl')
optdepends=('python2-notify' 'ffmpeg' 'ffmpeg2theora')
makedepends=('subversion' 'python2-distribute' 'rst2html5')
source=("${pkgname%%-svn}::svn://svn.sv.gnu.org/watchvideo")

pkgver() {
	cd $srcdir/${pkgname%%-svn}
	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
	cd $srcdir/${pkgname%%-svn}
	python2 setup.py build
	sed -i 's/pyuic4/python2-pyuic4/g' Makefile
	sed -i 's/lrelease/lrelease-qt4/g' Makefile
	sed -i 's/easy_install/echo/g' Makefile
	make all
}

package() {
	cd $srcdir/${pkgname%%-svn}
	python2 setup.py install --root=$pkgdir
	make DESTDIR="$pkgdir" PYTHON=python2 prefix=/usr install-data
	make DESTDIR="$pkgdir" PYTHON=python2 prefix=/usr installdirs
	cp -r ${pkgname%%-svn}/ui_* $pkgdir/usr/lib/python2.7/site-packages/watchvideo/
	chmod 775 -R $pkgdir/usr/lib/python2.7/site-packages/watchvideo/ui_*
	rm $pkgdir/usr/lib/python2.7/site-packages/watchvideo/*.pyc
}

md5sums=('SKIP')
