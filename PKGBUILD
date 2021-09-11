# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Jakob Gruber <jakob.gruber@gmail.com>

pkgname=stone-soup-yiuf
pkgver=1.5.5b1
pkgrel=2
pkgdesc='A fork of Dungeon Crawl Stone Soup roguelike with old races recovered'
arch=('i686' 'x86_64')
url='https://github.com/yrmvgh/yiufcrawl'
depends=('lua51' 'ncurses' 'sdl2_image' 'sqlite' 'glu' 'freetype2' 'ttf-dejavu')
makedepends=('bison' 'flex' 'gendesk' 'mesa')
optdepends=('advancecomp: for recompressing the tilesheets'
             'pngcrush: for recompressing the tilesheets')
conflicts=('crawl' 'stone-soup-tile')
license=('GPL' 'BSD' 'MIT' 'ZLIB' 'APACHE' 'custom:CC0' 'custom')
source=("https://github.com/yrmvgh/yiufcrawl/archive/${pkgver}-yiuf.tar.gz")
sha256sums=('dfe40fe9bfccc98e8ed5a6cc216792d26f16f3180527f7cc442a1c73c22bce74')

# used by gendesk to create .desktop file
_exec=('yiufcrawl-tiles')
_name=('Dungeon Crawl Stone Soup (Yiuf branch)')

package() {
    cd "$srcdir"
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
            --exec 'yiufcrawl-tiles' --name 'Dungeon Crawl Stone Soup (Yiuf branch)' PKGBUILD

    cd "yiufcrawl-${pkgver}-yiuf/crawl-ref/source"

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

    make DESTDIR="${pkgdir}" \
         DATADIR="/usr/share/${pkgname}/data" \
         SAVEDIR="~/.yiufcrawl" \
         USE_UNICODE=y \
         TILES=y \
         install

    # rename tiles executable to avoid clashing with console crawl

    mv "${pkgdir}/usr/bin/yiufcrawl" "${pkgdir}/usr/bin/yiufcrawl-tiles"

    # then build and install console version

    make DESTDIR="${pkgdir}" \
         DATADIR="/usr/share/${pkgname}/data" \
         SAVEDIR="~/.yiufcrawl" \
         USE_UNICODE=y \
         install

    # install crawl license

    install -D -m644 ../licence.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    install -D -m644 ../docs/license/* \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    # install icon and .desktop file

    install -D -m644 dat/tiles/stone_soup_icon-32x32.png \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
