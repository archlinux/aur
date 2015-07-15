# Maintainer: Lukas Sabota (lukas@lwsabota.com)
# Contributor: Lukas Sabota (lukas@lwsabota.com)
pkgname=ggmud-svn
pkgver=r267
pkgrel=1
pkgdesc="GTK2 mud client inspired by tintin and sclient."
arch=('i686' 'x86_64')
url="http://www.ggsoft.org/ggmud/"
license=('GPL')
depends=('gtk2' 'lua')
makedepends=('subversion')
source=(svn://svn.code.sf.net/p/ggmud/code/trunk/ggmud/)
sha256sums=('SKIP')

_svnmod=ggmud

pkgver() {
  cd "$_svnmod"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  sed -i "s/--as-needed//g" Makefile
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  install -D -m755 ggmud "$pkgdir/usr/bin/$pkgname"
  install -D -m644 "gg_help.txt" "${pkgdir}/usr/share/$pkgname/gg_help.txt"

  #.desktop + icon file -- commented out in order to not conflict with ggmud
  #   feel free to uncomment
  #install -D -m644 "${srcdir}/ggmud/ggmud.desktop" \
  #    "${pkgdir}/usr/share/applications/$pkgname.desktop" || return 1
  #install -D -m644 "${srcdir}/ggmud/ggmud.png" \
  #    "${pkgdir}/usr/share/pixmaps/$pkgname.png" || return 1
}
