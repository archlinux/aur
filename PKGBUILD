# Contributor: alphazo <alphazo@gmail.com>
# Original PKGBUILD from reflexing <reflexing@reflexing.ru>
pkgname=wikidpad
pkgver=2.2
pkgrel=1
pkgdesc="wikidPad is a Wiki-like notebook for storing your thoughts, ideas, todo lists, contacts, or anything else you can think of to write down."
arch=('any')
url="http://wikidpad.sourceforge.net/"
license=('custom')
depends=('wxpython' 'python2-pysqlite')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/wikidpad/WikidPad-$pkgver-src.zip
    wikidpad
    wikidpad.desktop
    wikidpad.png
)
noextract=(WikidPad-$pkgver-src.zip)
md5sums=('27590187290b28bdc9b244d01ac9cff8'
         '5ac44ec35c09861e631c86596142a47c'
         'f5b1ea28f93fefdccca204024e1bcfbf'
         'c44e552a8b856610a3e859d1602d5cf1')

prepare() {
    cd "$srcdir"
	
	# proper extract
	mkdir $pkgname-$pkgver
	unzip WikidPad-$pkgver-src.zip -d $pkgname-$pkgver
	
	# Patch for Python2 compatibility
	cd $pkgname-$pkgver
	sed -i -e "s|env python|env python2|" *.py
	sed -i -e "s|/bin/python|/usr/bin/python2|" *.py
	cd ..
}

package() {
    # dirty copying whole Python sources due to the lack of good 'python setup.py install'
    # functionality (TODO: setup.py fixes to make it crossplatform)
    mkdir -p $pkgdir/usr/share/$pkgname
    cp -r $pkgname-$pkgver/* $pkgdir/usr/share/$pkgname
  
    # install run wrapper
    install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
      
    # install icons
    install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
          
    # install DE menu items
    install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}