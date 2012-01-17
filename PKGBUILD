# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
# $Id$
pkgname=pdfsizeopt-svn
pkgver=171
pkgrel=1
pkgdesc="PDF file size optimizer"
arch=(any)
url="https://code.google.com/p/pdfsizeopt"
license=('GPL2')
groups=()
depends=("python2>=2.4" "ghostscript>=8.61" "sam2p" "tif22pnm")
makedepends=('subversion')
optdepends=("multivalent-pdf-tools: to optimise cross reference table and object serialisation [use --use-multivalent=true]"
            "pngout: to optimise the size of PNG parts [use --use-jbig2=true]"
            "jbig2enc: to manage JBIG2 parts [use --use-pngout=true]")
source=("archpackage.patch")

_svntrunk=http://pdfsizeopt.googlecode.com/svn/trunk/
_svnmod=pdfsizeopt

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  cd $_svnmod
  patch -p0 < $srcdir/archpackage.patch
}

package() {
  install -D -m 755 $srcdir/pdfsizeopt/pdfsizeopt.py $pkgdir/usr/bin/pdfsizeopt
}

# vim:set ts=2 sw=2 et:
md5sums=('0c2bfe7f87cfcdc6774015c0d6fa15f7')
