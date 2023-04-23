# Maintainer : Frederic Bezies <fredbezies at gmail dot com> 

# This PKGBUILD is based on work stone-soup-tiles stable PKGBUILD
# For curious players only ;)

pkgname=stone-soup-tiles-git
_pkgname=crawl
pkgver=0.30.a0.r1124.g6e8f0f562f
pkgrel=1
pkgdesc="Community maintained variant of Linley's Dungeon Crawl (tiles) - git version"
arch=('i686' 'x86_64' 'aarch64')
url="http://crawl.develz.org"
depends=(sdl2_image xdg-utils freetype2 glu sqlite)
makedepends=(pngcrush git python-yaml lua)
license=('custom')
conflicts=('crawl' 'stone-soup-tiles')
source=(git+https://github.com/crawl/crawl.git
stone-soup-tiles-git.desktop)
sha256sums=('SKIP'
            'bc6985944bd5fc44d96fe705725430e97161b5e428ab17e6cf7a0d7976681119')

prepare() {
	cd "${srcdir}/${_pkgname}"
  	git submodule update --init
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}/crawl-ref/source"
  
  make prefix=/usr DESTDIR="${pkgdir}" SAVEDIR="~/.stone-soup/" \
         DATADIR="/usr/share/${_pkgname}/data" \
         USE_UNICODE=y TILES=y install
  
  # Some dirty operations needed to get everything working.
  
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  mkdir -p $pkgdir/usr/bin/
  mv "${pkgdir}/usr/games/crawl" "${pkgdir}/usr/bin/crawl"
  rm -rf $pkgdir/usr/games/
  
  install -D -m644 $srcdir/$_pkgname/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/license.txt"
  
  cp ${srcdir}/${_pkgname}/crawl-ref/source/dat/tiles/stone_soup_icon-32x32.png $pkgdir/usr/share/pixmaps/$pkgname.png
  cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/
}

