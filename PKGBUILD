# Contributor: Thomas Oster <thomas.oster@rwth-aachen.de>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs
pkgver=0.17
pkgrel=1
pkgdesc="A project with the goal of developing a collection of utilities to allow for better client integration with some of the popular version control systems (core)"
arch=('any')
#url="http://rabbitvcs.org/"
url="https://github.com/rabbitvcs/rabbitvcs"
install=${pkgname}.install
changelog=${pkgname}.changelog
depends=('git' 'pygtk' 'python2-pysvn' 'python2-dulwich' 'python2-gobject2' 'python2-configobj' 'python2-simplejson' 'python2-gtkspellcheck' 'tk')
optdepends=('meld: graphical diff viewer')
makedepends=('python2-setuptools')
license=('GPL')
_gitcommit="a508bee84cbffab7ae9bc86d1569e08ad54361a8"
if [ "${_gitcommit}" != "" ]; then
  source=("rabbitvcs-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("rabbitvcs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
md5sums=('f34ba22c17bd487838a9f0db764d52c1')
#md5sums=('SKIP')


build() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
	cd "$srcdir/$pkgname-$pkgver"
	sed -i "s#env python#env python2#" setup.py
	sed -i "s#!= 'Darwin'#== 'toto'#" setup.py
	find . -name "*.py" | xargs grep -l sys.executable | xargs sed -i 's|sys\.executable|"/usr/bin/python2"|g'
	python2 setup.py build 
}
	
package(){
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
