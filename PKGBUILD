# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Maintainer: Reihar <reihar@necronomicon.fr>

pkgname=stone-soup-ncurses
pkgver=0.16.1
pkgrel=3
pkgdesc='Open-source, single-player, role-playing roguelike game of exploration and treasure-hunting (ncurses-only)'
arch=('i686' 'x86_64')
url='http://crawl.develz.org/'
depends=('lua51' 'ncurses' 'sqlite' 'ttf-dejavu')
makedepends=('bison' 'flex')
conflicts=('crawl' 'stone-soup' 'stone-soup-tile' 'stone-soup-git')
license=('custom')
install=stone-soup-ncurses.install
source=("https://github.com/crawl/crawl/archive/$pkgver.tar.gz")
md5sums=('262d973b56cc0d4ad2351dd370be2ef1')


package() {
    cd "$srcdir"
    cd "crawl-${pkgver}/crawl-ref/source"
	
    # git tarball weirdness
    echo "$pkgver" > util/release_ver
    
    # adjust makefile to use /usr/bin, owner root:root,
    # disable setgid on executable

    sed -i 's|bin_prefix    := bin|bin_prefix    := usr/bin|' Makefile
    sed -i 's/INSTALL_UGRP := games:games/INSTALL_UGRP := root:root/' Makefile
    sed -i 's|MCHMOD := 2755|MCHMOD := 755|' Makefile

    
    #Building the console version
    make DESTDIR="${pkgdir}" \
         SAVEDIR="~/.crawl/" \
         DATADIR="/usr/share/${pkgname}/data" \
         USE_UNICODE=y \
         install

    # install crawl license

    install -D -m644 ../licence.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

}
