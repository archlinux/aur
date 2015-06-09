# Maintainer:  Shaw <puxx@mail.ustc.edu.cn>

pkgname=retext-git
pkgver=20130920
pkgrel=1
pkgdesc="A simple editor for Markdown and ReStructuredText markup languages"
arch=('any')
url="http://retext.sourceforge.net/"
license=('GPL3')
depends=('python-pyqt5'
         'python-markups'
         'shared-mime-info'
         'xdg-utils'
         'desktop-file-utils'
         'gconf')
makedepends=('imagemagick' 'git' 'qt5-tools')
optdepends=('python-markdown: for Markdown language support'
            'python-docutils: for reStructuredText language support'
            'python-pyenchant: for spell checking support')
provides=('retext')
conflicts=('retext')
source=("$pkgname::git://git.code.sf.net/p/retext/git"
        "retext.desktop"
        "x-retext-markdown.xml"
        "x-retext-rst.xml")
install="$pkgname".install
md5sums=('SKIP'
         'ac6cb2a020238fe03f0f52610c976cdd'
         '48becfce7b920c7a2b875626386d1e74'
         '8c32c71bc2b2f49e15595a1808780d42')

build () {
	cd $srcdir/$pkgname/locale
	lrelease-qt5 *.ts
}

package () {
	cd $srcdir/$pkgname
	python setup.py install --root="$pkgdir"

	# install icons
	for size in 16 22 24 32 48 128; do
		mkdir -p $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps
		convert -resize $size icons/retext.png $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/retext.png
	done
	install -Dm644 icons/retext.svg $pkgdir/usr/share/icons/scalable/apps/retext.svg

	# install mime files
	install -Dm644 $srcdir/x-retext-markdown.xml $pkgdir/usr/share/mime/packages/x-retext-markdown.xml
	install -Dm644 $srcdir/x-retext-rst.xml $pkgdir/usr/share/mime/packages/x-retext-rst.xml

	# install desktop file
	install -Dm644 $srcdir/retext.desktop $pkgdir/usr/share/applications/retext.desktop
}

