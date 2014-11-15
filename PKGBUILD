# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: György Balló <ballogy@freestart.hu>

pkgbase=python-flickrapi
pkgname=(python-flickrapi python2-flickrapi)
_pkgname=flickrapi
pkgver=2.0
pkgrel=1
pkgdesc="The official Python interface to the Flickr API"
arch=('any')
url="http://stuvel.eu/flickrapi"
license=('Python')
makedepends=('python-docutils' 'python2-docutils' 'python-setuptools' 'python2-setuptools' 'python-requests-toolbelt' 'python2-requests-toolbelt'
             'python-requests-oauthlib' 'python2-requests-oauthlib' 'python-six' 'python2-six')
checkdepends=('python-nose' 'python2-nose')
source=("http://pypi.python.org/packages/source/f/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('634aede2e33f044265b9332296ab4352670ee00e681d1ebcd5c612ef88b1bed35fb8bcecf4de63b2d6cfa660cb31c6903375ed4b660c39c9c16586fe51708c7a')

prepare() {
  cp -a $_pkgname-$pkgver{,-py2}

  cd $_pkgname-$pkgver-py2
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

build() {
  cd $_pkgname-$pkgver
  python setup.py build

  cd ../$_pkgname-$pkgver-py2
  python2 setup.py build
}

check() {
  # Tests not shipped
  return

  cd $_pkgname-$pkgver
  python runtests

  cd ../$_pkgname-$pkgver-py2
  python2 runtests
}

package_python-flickrapi() {
  depends=('python-six' 'python-requests-oauthlib' 'python-requests-toolbelt')

  cd "$srcdir/$_pkgname-$pkgver"

  python setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python2-flickrapi() {
  depends=('python2-six' 'python2-requests-oauthlib' 'python2-requests-toolbelt')

  cd "$srcdir/$_pkgname-$pkgver-py2"

  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
