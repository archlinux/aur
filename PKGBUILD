# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from SVN sources.

# Maintainer: Roman Beslik <me@beroal.in.ua>
pkgname=python2-template-toolkit-svn
pkgver=170
pkgrel=1
pkgdesc="Python port of the Perl Template Toolkit"
arch=("any")
url="http://www.template-toolkit.org/python/"
license=('Artistic2.0')
depends=("licenses" "python2")
makedepends=('subversion')
options=(!emptydirs)

_svntrunk=svn://svn.tt2.org/Template-Python/trunk
_svnmod=Template-Python

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
}

package() {
  cd "$srcdir/$_svnmod-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
