# Maintainer:  Daniel YC Lin <dlin.tw gmail>
# Contributor: allencch <allencch hotmail>

pkgname=yaffs2utils-svn
pkgver=51
pkgrel=1
pkgdesc="A collection of utilities to make/extract a YAFFS2/YAFFS1 image for Linux."
arch=(i686 x86_64)
url=http://code.google.com/p/yaffs2utils
license=('GPL2')
makedepends=('svn' 'gcc')
depends=('glibc')
options=('strip')
conflicts=('yaffs2utils-latest' 'yaffs2utils')
source=()

_svntrunk="http://yaffs2utils.googlecode.com/svn/trunk/"
_svnmod="yaffs2utils-svn"

build() {
  cd $srcdir
  msg "Connecting to $_svntrunk SVN server...."
  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver" )
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  svn export --force $_svnmod $_svnmod-build
  cd $_svnmod-build
  touch configs.h
  sed -i 's/\($(CC) \)$(LDFLAGS)\(.*\)$/\1\2 $(LDFLAGS)/g' Makefile
  make
}

package() {
  cd $_svnmod-build
  mkdir -p $pkgdir/usr/bin/
  install -m 0755 $srcdir/$_svnmod-build/mkyaffs2 \
                  $srcdir/$_svnmod-build/unyaffs2 $pkgdir/usr/bin/
}
# vim:set ts=2 sw=2 et sta:
