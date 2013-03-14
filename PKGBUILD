# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python-efl-svn
pkgver=84427
pkgrel=1
pkgdesc="Python bindings for the Enlightenment Foundataion Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('elementary-svn' 'python-dbus')
makedepends=('subversion' 'cython')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/BINDINGS/python/python-efl/"
_svnmod="python-efl"

build() {
  cd "$srcdir"

  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  python setup.py build_ext
}

package() {
  cd "$srcdir/$_svnmod-build"
  python setup.py install --root="$pkgdir"

  rm -r "$srcdir/$_svnmod-build"
}
