# Maintainer : Frederic Bezies <fredbezies at gmail dot com> 

# This PKGBUILD is based on work stone-soup-tiles stable PKGBUILD
# For curious players only ;)

pkgname=stone-soup-tiles-git
_pkgname=crawl
pkgver=0.26.a0.r500.g60e829e2c0
pkgrel=1
pkgdesc="Community maintained variant of Linley's Dungeon Crawl (tiles) - git version"
arch=('i686' 'x86_64')
url="http://crawl.develz.org"
depends=(lua sdl2_image xdg-utils freetype2 glu sqlite)
makedepends=(pngcrush git python-yaml)
license=('GPL2')
conflicts=('crawl' 'stone-soup-tiles')
source=(git://github.com/crawl/crawl.git
stone-soup-tiles-git.desktop)
sha1sums=('SKIP'
          'f598ea37ab97dd34f0d35f33b0b4b3bfc928067d')

prepare() {
	cd "${srcdir}/${_pkgname}"
  	git submodule update --init
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}/crawl-ref/source"
  make prefix=/usr/bin \
       DESTDIR="${pkgdir}" \
       SAVEDIR="~/.crawl/" \
       DATADIR="/usr/share/${pkgname}/data" \
       TILES=y SAVEDIR='~/.crawl'

}

package() {
  cd "${srcdir}/${_pkgname}/crawl-ref/source"
  make install prefix="${pkgdir}/usr/" DATADIR="${pkgdir}/usr/share/${pkgname}/data" TILES=y SAVEDIR='~/.crawl'
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  cp ${srcdir}/${_pkgname}/crawl-ref/source/dat/tiles/stone_soup_icon-32x32.png $pkgdir/usr/share/pixmaps/$pkgname.png
  cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/
}

