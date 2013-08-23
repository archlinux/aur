# Contributor: Anton Leontiev <bunder[at]t-25.ru>
pkgname=mkdoc-svn
pkgver=74
pkgrel=1
pkgdesc="C/C++ documentation tool"
arch=("any")
url="http://savannah.nongnu.org/projects/mkdoc/"
license=('GPL')

depends=('perl')
makedepends=('subversion')
source=(Makefile.patch)
md5sums=('2e862d1eaf0efc01041b779479a0019f')

_svntrunk=svn://svn.savannah.nongnu.org/mkdoc/trunk
_svnmod=mkdoc

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

  patch -i "$srcdir/Makefile.patch"
}

package() {
  cd "$srcdir/$_svnmod-build"
  make PREFIX="$pkgdir/usr" install
  export PATH=$PATH:$pkgdir/usr/share/mkdoc
  make PREFIX="$pkgdir/usr" install-doc
}
