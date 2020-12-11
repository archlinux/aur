# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>

pkgname=bcrawl
pkgver=1.28.2
pkgrel=1
pkgdesc='Continuation of X-Crawl fork of Dungeon Crawl Stone Soup roguelike with new content'
arch=('i686' 'x86_64')
url='https://github.com/b-crawl/bcrawl'
depends=('lua51' 'sdl2_image' 'sqlite' 'glu' 'ttf-dejavu')
makedepends=('flex' 'gendesk' 'mesa')
optdepends=('advancecomp: for recompressing the tilesheets'
            'pngcrush: for recompressing the tilesheets')
conflicts=('crawl' 'stone-soup-tile' 'bcrawl-git')
provides=('bcrawl')
license=('GPL' 'BSD' 'MIT' 'ZLIB' 'APACHE' 'custom:CC0' 'custom')
source=("https://github.com/b-crawl/bcrawl/archive/bcrawl-${pkgver}.tar.gz")
sha256sums=('9ceb2e7ea75657ac1de26987d01dfc24b6e232bc0e0e441c5ad8340df5b3c102')

# used by gendesk to create .desktop file
_exec=('bcrawl-tiles')
_name=('Dungeon Crawl Stone Soup (bcrawl fork)')

package() {
    cd "$srcdir"
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
            --exec 'bcrawl-tiles' --name 'Dungeon Crawl Stone Soup (bcrawl fork)' PKGBUILD

    cd "bcrawl-bcrawl-${pkgver}/crawl-ref/source"

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

    make GAME=bcrawl \
         DESTDIR="${pkgdir}" \
         DATADIR="/usr/share/${pkgname}/data" \
         SAVEDIR="~/.bcrawl" \
         USE_UNICODE=y \
         TILES=y \
         install

    # rename tiles executable to avoid clashing with console crawl

    mv "${pkgdir}/usr/bin/bcrawl" "${pkgdir}/usr/bin/bcrawl-tiles"

    # then build and install console version

    make GAME=bcrawl \
         DESTDIR="${pkgdir}" \
         DATADIR="/usr/share/${pkgname}/data" \
         SAVEDIR="~/.bcrawl" \
         USE_UNICODE=y \
         install

    # install crawl license

    install -D -m644 ../../LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 ../docs/license/* \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    # install icon and .desktop file

    install -D -m644 dat/tiles/stone_soup_icon-32x32.png \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
