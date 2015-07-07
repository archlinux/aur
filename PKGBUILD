# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=globs-svn
pkgver=50
pkgrel=2
pkgdesc="GL Open Benchmark Suite"
arch=('any')
url="http://globs.sourceforge.net"
license=('GPL')
depends=('pygtk')
makedepends=('subversion' 'scons' 'gettext')
optdepends=('python-matplotlib')
provides=('globs')

_svntrunk=https://globs.svn.sourceforge.net/svnroot/globs/globs/trunk
_svnmod=globs

build() {
  cd $srcdir

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

  # Make program
  scons install root=$pkgdir prefix=/usr
  python2 patchdir.py prefix=/usr
  python2 setup.py install --root=$pkgdir --prefix=/usr
}
