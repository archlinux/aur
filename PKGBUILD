# Maintainer: Christoph J. Thompson <thompsonc at protonmail dot ch>

_pkgname=gopherus
_pkgver=1.1
pkgname=$_pkgname-svn
pkgver=1.1.r33
pkgrel=1
pkgdesc="Gopher client"
arch=('i686' 'x86_64')
url="http://gopherus.sourceforge.net"
license=('GPL3')
depends=('ncurses')
optdepends=('sdl2')
makedepends=('subversion')
conflicts=('gopherus')
provides=('gopherus')
source=("$_pkgname::svn://svn.code.sf.net/p/gopherus/code"
        'gopherus.desktop')
sha256sums=('SKIP'
            'dfce631c4c60761a5324e90dbe9938f9f74b21b68ee4e8c1bf8dc36018ad32cb')

pkgver() {
  cd "${_pkgname}"
  local ver="$(svnversion)"
  printf "${_pkgver}.r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${_pkgname}/trunk"
  sed -i '/upx --best --lzma/d' Makefile.lin
  make -f Makefile.lin
  make -f Makefile.lin gopherus-sdl
}

package() {
  cd "${_pkgname}/trunk"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 gopherus gopherus-sdl "${pkgdir}/usr/bin"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m644 gopherus.txt history.txt \
   "${pkgdir}/usr/share/doc/${_pkgname}"

  install -Dm644 icon.svg \
   "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

  install -Dm644 "${srcdir}/gopherus.desktop" \
   "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
