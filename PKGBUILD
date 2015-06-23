# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributer: Magnus Woldrich <trapd00r@trapd00r.se>
pkgname=colortest-256-ng-git
pkgver=20100822
pkgrel=1
pkgdesc="Gives a visual presentation of what the 256 colors indexes is and how \ 
         they look"
arch=('any')
url="http://github.com/trapd00r/colortest-256-ng.git"
license=('GPLv2')
depends=('perl' 'perl-term-extendedcolor' 'perl-term-extendedcolor-xresources')
makedepends=('git')
source=()
md5sums=() 

_gitroot="git://github.com/trapd00r/colortest-256-ng.git"
_gitname="colortest-256-ng"

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir -p $pkgdir/usr/bin

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { perl Makefile.PL &&
    make &&
    make install; } || return 1

}
