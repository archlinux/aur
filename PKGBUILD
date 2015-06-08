# Contributor: Bruno Galeotti <bravox87 at gmail dot com>
pkgname='python2-oauth-svn'
pkgver=1134
pkgrel=1
pkgdesc="An open protocol to allow API authentication in a simple and standard method from desktop and web applications."
arch=('i686' 'x86_64')
url="http://code.google.com/p/oauth/"
license=('MIT')
depends=('python2-distribute')
makedepends=('python2' 'subversion')
provides=('python2-oauth')
conflicts=('python-oauth')
_svntrunk='http://oauth.googlecode.com/svn/code/python/'
_svnmod='python-oauth'

build() {
  cd ${srcdir}
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  if [ -d $_svnmod-build ]; then
    msg 'Removing old build directory'
    rm -rf $_svnmod-build
  fi

  msg 'Copying repository to another build directory'
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build

  msg 'Starting build'
  cd $srcdir/$_svnmod-build

  msg 'Running setup.py'
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1

  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${_svnmod}/LICENSE
}

# vim:set ts=2 sw=2 et: 
