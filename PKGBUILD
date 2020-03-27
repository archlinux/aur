# Maintainer : Frederic Bezies <fredbezies at gmail dot com> 

# This PKGBUILD is based on work stone-soup-tiles stable PKGBUILD
# For curious players only ;)

pkgname=stone-soup-tiles-git
_pkgname=crawl
pkgver=0.25.a0.r667.gb977e01cb5
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
          'ce24ff5951fc11717bae3b361f16fde813502d12')

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
  make DESTDIR="${pkgdir}" \
       SAVEDIR="~/.crawl/" \
       DATADIR="/usr/share/${pkgname}/data" \
       TILES=y SAVEDIR='~/.crawl'

}

package() {
  cd "${srcdir}/${_pkgname}/crawl-ref/source"
  make install prefix="${pkgdir}/usr/share/" TILES=y SAVEDIR='~/.crawl'
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  cp ${srcdir}/${_pkgname}/crawl-ref/source/dat/tiles/stone_soup_icon-32x32.png $pkgdir/usr/share/pixmaps/$pkgname.png
  cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/
}

