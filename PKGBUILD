# Maintainer: philomath <philomath868 AT gmail DOT com>
# Maintainer: Pavel Borzenkov <pavel@voidptr.ru>

pkgname=pahole
pkgver=1.10
pkgrel=2
pkgdesc="Various DWARF utils"
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=devel/pahole/pahole.git;a=summary"
license=('GPL2')
source=("pahole-remove-tag-mutable.diff")
depends=('elfutils' 'python')
makedepends=('git' 'cmake')
replaces=('dwarves')
changelog=${pkgname}.changelog
md5sums=("fced1e021c244ff7403cab816da63e98")
sha1sums=("5b5c3dbd9bc2313119fb478db857033745babea4")

_gitroot='git://git.kernel.org/pub/scm/devel/pahole/pahole.git'

build()
{
  cd "$srcdir"
  if [[ -d "$pkgname" ]]; then
    cd "$pkgname"
    git pull
  else
    git clone "$_gitroot" "$pkgname"
  fi

  rm -rf "$srcdir/$pkgname-build"
  git clone "$srcdir/$pkgname" "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build"

  git checkout -b cur "v$pkgver"
  patch -p1 < ${srcdir}/pahole-remove-tag-mutable.diff

  cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr -D__LIB=lib . || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-build"
  make DESTDIR=${pkgdir}/ install
}

# vim:set ts=2 sw=2 et:
