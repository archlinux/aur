# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Liganic <liganic-aur@gmx.net>
pkgname=opencollada
pkgver=864
pkgrel=1
pkgdesc="Stream based reader and writer library for COLLADA files"
arch=(i686 x86_64)
url="https://code.google.com/p/opencollada/"
license=('GPL')
depends=('libxml2')
makedepends=('subversion' 'ruby' 'cmake')
options=(!libtool !strip)

_svntrunk=http://opencollada.googlecode.com/svn/trunk/
_svnmod=opencollada

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

  _builddir="$srcdir/$_svnmod-build"

  rm -rf $_builddir
  cp -r "$srcdir/$_svnmod" $_builddir
  cd $_builddir

  mkdir cmake
  cd cmake
  cmake ../ 
  cd $_builddir/cmake
  make

#  cd scripts/
#  chmod +x unixbuild.sh
#  ./unixbuild.sh $pkgdir/usr/
}

package() {
  _builddir="$srcdir/$_svnmod-build"
#  sed -i "s/libdir='.*'/libdir=\'\/usr\/lib\'/" $pkgdir/usr/lib/*.la*

# Headers
  rm -rf `find $_builddir -type d -name .svn`
  mkdir -p $pkgdir/usr/include/opencollada/
  cd $_builddir
  _include_dirs=$(find . -type d -name include -and -not -path '*Externals*' -print)
  for dir in $_include_dirs;do
    mkdir -p $pkgdir/usr/include/opencollada/${dir}
    cp -r ${dir}/* $pkgdir/usr/include/opencollada/${dir}/..
   done

  rm -rf $pkgdir/usr/include/opencollada/generated*

  cp -r $_builddir/cmake/lib/ $pkgdir/usr/
  cp -r $_builddir/cmake/bin/ $pkgdir/usr/
}

# vim:set ts=2 sw=2 et:
