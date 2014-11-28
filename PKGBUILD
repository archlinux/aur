# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=evad-svn
pkgver=112
pkgrel=1
pkgdesc="SVN version of a text-based client to the powerful MPD music server."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/evad/"
license=('GPL')
depends=('python2' 'mpd')
makedepends=('subversion')
provides=('evad')
conflicts=('evad')
source=()
md5sums=()

_svntrunk=http://evad.svn.sourceforge.net/svnroot/evad/trunk
_svnmod=evad

prepare() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -d $_svnmod-build ]; then
    (rm -r ${srcdir}/$_svnmod-build && cp -r $_svnmod $_svnmod-build)
  else
    cp -r $_svnmod $_svnmod-build
  fi
}

package() {
  cd ${srcdir}/$_svnmod-build

  python2 setup.py install --root=${pkgdir}
}
