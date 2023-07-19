# Maintainer: gilcu3
# Contributor: Thomas Oster <thomas.oster@rwth-aachen.de>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs
pkgver=0.19
pkgrel=1
#_gitcommit='e44328e01ed82dd8a8dbfec952f5982e355b8416'
pkgdesc="A project with the goal of developing a collection of utilities to allow for better client integration with some of the popular version control systems (core)"
arch=('any')
#url="http://rabbitvcs.org/"
url="https://github.com/rabbitvcs/rabbitvcs"
install=${pkgname}.install
changelog=${pkgname}.changelog
depends=('git' 'gtk3' 'python-pysvn' 'python-dulwich' 'python-gobject' 'python-configobj' 'python-simplejson' 'python-gtkspellcheck' 'tk')
optdepends=('meld: graphical diff viewer')
makedepends=('python-setuptools')
license=('GPL')
if [ "${_gitcommit}" != "" ]; then
  source=("rabbitvcs-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("rabbitvcs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
sha256sums=('83deaafb1e95f4eae9cf083ba2296507c909540cbcb5a0616ee0dd9dbf903e74')
#sha256sums=('SKIP')


build() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
	cd "$srcdir/$pkgname-$pkgver"
	sed -i "s#0.18#${pkgver}#" ./rabbitvcs/__init__.py
	sed -i "s#0.18#${pkgver}#" setup.py
	# sed -i "s#!= 'Darwin'#== 'toto'#" setup.py
	# sed -i "s#import hashlib#import hashlib, urllib#" ./rabbitvcs/util/helper.py
	# find . -name "*.py" | xargs grep -l sys.executable | xargs sed -i 's|sys\.executable|"/usr/bin/python2"|g'
	python setup.py build 
}
	
package(){
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
