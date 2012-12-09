# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=trac-xmlrpc-svn
pkgver=12168
pkgrel=1
pkgdesc="Remote Procedure Call plugin for Trac"
arch=('any')
url="http://trac-hacks.org/wiki/XmlRpcPlugin"
license=('BSD')
depends=('trac')
makedepends=('subversion')

_svntrunk=http://trac-hacks.org/svn/xmlrpcplugin/trunk
_svnmod=rpcplugin

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

  python2 setup.py build
}

package() {
  cd "$srcdir/$_svnmod-build"
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
