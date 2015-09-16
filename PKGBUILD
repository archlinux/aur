# Maintainer: yantis@yantis.net
# Contributor: Felipe Morales <hel.sheep@gmail.com>

pkgname=python2-leveldb-svn
pkgver=15
pkgrel=2
pkgdesc="A python wrapper for leveldb"
arch=("any")
url="http://code.google.com/p/py-leveldb/"
license=('BSD')
depends=('snappy' 'leveldb' 'gperftools')
makedepends=('subversion' 'python2')

_svntrunk=http://py-leveldb.googlecode.com/svn/trunk/
_svnmod=leveldb

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  python2 setup.py build
}

package() {
  cd "$_svnmod-build"

  python2 setup.py install --root=/$pkgdir/ --optimize=1
}
