# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Jakob Gruber <jakob.gruber@gmail.com>

pkgname=stone-soup-yiuf
pkgver=1.4.3
pkgrel=1
pkgdesc='A fork of Dungeon Crawl Stone Soup roguelike with old races recovered'
arch=('i686' 'x86_64')
url='https://github.com/yrmvgh/crawl/'
depends=('lua51' 'ncurses' 'sdl2_image' 'sqlite' 'glu' 'freetype2' 'ttf-dejavu')
makedepends=('bison' 'flex' 'gendesk' 'mesa')
conflicts=('crawl' 'stone-soup-tile')
license=('custom')
source=("https://github.com/yrmvgh/crawl/archive/${pkgver}.tar.gz")
sha256sums=('b557bb56bdc275d80f327c91a26aab9a15cfcf8b6f683926e7bd2a6d728645d1')

# used by gendesk to create .desktop file
_exec=('crawl-yiuf-tiles')
_name=('Dungeon Crawl Stone Soup (Yiuf branch)')

package() {
    cd "$srcdir"
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
            --exec 'crawl-yiuf-tiles' --name 'Dungeon Crawl Stone Soup (Yiuf branch)' PKGBUILD

    cd "crawl-${pkgver}/crawl-ref/source"

    # 0.16.0 weirdness
    sed -i 's|SDL_main.h|SDL2/&|' main.cc

    # git tarball weirdness
    echo "$pkgver" > util/release_ver

    # adjust makefile to use /usr/bin, owner root:root,
    # disable setgid on executable

    sed -i 's|bin_prefix    := bin|bin_prefix    := usr/bin|' Makefile
    sed -i 's/INSTALL_UGRP := games:games/INSTALL_UGRP := root:root/' Makefile
    sed -i 's|MCHMOD := 2755|MCHMOD := 755|' Makefile

    # first build and install tiles version

    make GAME=crawl-yiuf \
         DESTDIR="${pkgdir}" \
         SAVEDIR="~/.crawl-yiuf/" \
         DATADIR="/usr/share/${pkgname}/data" \
         USE_UNICODE=y \
         TILES=y \
         install

    # rename tiles executable to avoid clashing with console crawl

    mv "${pkgdir}/usr/bin/crawl-yiuf" "${pkgdir}/usr/bin/crawl-yiuf-tiles"

    # then build and install console version

    make GAME=crawl-yiuf \
         DESTDIR="${pkgdir}" \
         SAVEDIR="~/.crawl-yiuf/" \
         DATADIR="/usr/share/${pkgname}/data" \
         USE_UNICODE=y \
         install

    # install crawl license

    install -D -m644 ../licence.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

    # install icon and .desktop file

    install -D -m644 dat/tiles/stone_soup_icon-32x32.png \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
