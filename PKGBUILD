# vim:set ts=2 sw=2 et:
# Maintainer: orumin <dev@orum.in>

pkgname=previous-svn
pkgver=r540
pkgrel=1
pkgdesc="NeXTSTEP Emulator"
arch=('i686' 'x86_64')
url="http://previous.alternative-system.com"
license=('GPL')
depends=('sdl2')
makedepends=('subversion' 'cmake')
replaces=('previous')
conflicts=('previous')
provides=('previous')
source=(previous::svn://svn.code.sf.net/p/previous/code/trunk
        previous-icon.patch)
md5sums=('SKIP'
         '0d1d1d6ceeae666ae590af1f8e518217')

_svntrunk=svn://svn.code.sf.net/p/previous/code/trunk
_svnmod=previous

pkgver() {
  cd "$srcdir/previous"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"

  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  patch -p1 < ../previous-icon.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
  cp "$srcdir/$_svnmod-build"/src/Rev_* "$pkgdir"/usr/share/previous/
}
