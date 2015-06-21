# Maintainer: Jakob Gruber <jakob.gruber@gmail.com>

pkgname=stone-soup-git
_pkgname=stone-soup
pkgver=0.17.a0.1409.ge6d9485
pkgrel=1
pkgdesc="An open-source, single-player, role-playing roguelike game of exploration and treasure-hunting"
arch=('i686' 'x86_64' 'ppc')
url='http://crawl.develz.org/'
depends=('lua51' 'ncurses' 'sdl_image' 'sqlite' 'glu' 'freetype2' 'ttf-dejavu')
makedepends=('git' 'bison' 'flex')
conflicts=('crawl' 'stone-soup' 'stone-soup-tile')
license=('custom')
backup=('usr/share/stone-soup/data/settings/tiles_options.txt'
        'usr/share/stone-soup/data/settings/init.txt')
source=("${_pkgname}.desktop"
        "git+https://github.com/crawl/crawl.git")
md5sums=('98be780cddb2a0915bbab15ad93644f1'
         'SKIP')

pkgver() {
    cd $srcdir/crawl
    git describe | sed 's#-#.#g'
}

package() {
    cd $srcdir/crawl/crawl-ref/source

    # adjust makefile to use /usr/bin, owner root:root, disable setgid on executable

    sed -i 's|bin_prefix    := bin|bin_prefix    := usr/bin|' Makefile
    sed -i 's/INSTALL_UGRP := games:games/INSTALL_UGRP := root:root/' Makefile
    sed -i 's|MCHMOD := 2755|MCHMOD := 755|' Makefile

    # first build and install tiles version

    make DESTDIR="${pkgdir}" \
         SAVEDIR="~/.stone-soup/" \
         DATADIR="/usr/share/${_pkgname}/data" \
         USE_UNICODE=y \
         TILES=y \
         install

    # rename tiles executable to avoid clashing with console crawl

    mv "${pkgdir}/usr/bin/crawl" "${pkgdir}/usr/bin/crawl-tiles"

    # then build and install console version

    make DESTDIR="${pkgdir}" \
         SAVEDIR="~/.stone-soup/" \
         DATADIR="/usr/share/${_pkgname}/data" \
         USE_UNICODE=y \
         install

    # install crawl license

    install -D -m644 ../licence.txt "${pkgdir}/usr/share/licenses/${_pkgname}/license.txt"

    # install icon and .desktop file

    install -D -m644 dat/tiles/stone_soup_icon-32x32.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

}
