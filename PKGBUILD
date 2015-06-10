# Contributor: alphazo <alphazo@gmail.com>
# Original PKGBUILD from reflexing <reflexing@reflexing.ru>
# Adapted for development version and new Python3 environment
# 
pkgname=wikidpad-dev
pkgver=2.3beta12
pkgrel=1
pkgdesc="wikidPad is a Wiki-like notebook for storing your thoughts, ideas, todo lists, contacts, or anything else you can think of to write down. [Development version]"
arch=('any')
url="http://wikidpad.sourceforge.net/"
license=('custom')
depends=('wxpython' 'python2-pysqlite')
makedepends=('unzip')
provides=('wikidpad')
conflicts=('wikidpad')
replaces=('wikidpad')
source=(http://downloads.sourceforge.net/wikidpad/WikidPad-$pkgver-src.zip
    wikidpad-dev
    wikidpad-dev.desktop
    wikidpad-dev.png
)

noextract=(WikidPad-$pkgver-src.zip)
md5sums=('0a29912e96a0bb74ace1b93824e58145'
         '37ff74df2af02a091c7b8d8533d5ad2b'
         'e93014425c38f4a7a023258fde5ac512'
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