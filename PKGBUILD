# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=ctags-php
pkgver=804
pkgrel=1
pkgdesc="Generates an index file of language objects found in source files. SVN trunk revision 804. With php patch."
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/p/ctags/patches/83/"

depends=('glibc')
makedepends=('subversion')

conflicts=('ctags')
provides=('ctags')

_svntrunk=http://svn.code.sf.net/p/ctags/code/trunk
_svndir=ctags

source=(
    'http://sourceforge.net/p/ctags/patches/_discuss/thread/3a930d9f/1405/attachment/0000-PHP-parser-rewrite.patch'
)

sha256sums=('689859265e7ea6b7246c8142d0d3844fd867826b01cbfe7fd4e2a29fa3b39336')

build() {
  cd ${srcdir}

  if [ -d $_svndir/.svn ]; then
      rm -rf $_svndir
  fi

  svn co $_svntrunk -r $pkgver $_svndir && cd $_svndir
  patch -p1 < ${srcdir}/0000-PHP-parser-rewrite.patch

  autoheader
  autoconf
  ./configure --prefix=/usr \
              --disable-external-sort

  make
}

package() {
  cd ${srcdir}/${_svndir}

  make prefix=${pkgdir}/usr install
}
