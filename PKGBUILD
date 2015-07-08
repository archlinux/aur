# Maintainer: Nazar Mishturak <nazarmx@gmail.com>

pkgname=crawl-sdl
pkgver=0.16.1
pkgrel=1
pkgdesc='An open-source, single-player, role-playing roguelike game of exploration and treasure-hunting in dungeons'
arch=('i686' 'x86_64')
url='http://crawl.develz.org'
license=('GPL2')
depends=('lua51' 'glu' 'sqlite' 'sdl2_image' 'sdl2_mixer' 'ttf-dejavu')
makedepends=('bison' 'flex' 'ttf-dejavu' 'gendesk')
source=("http://crawl.develz.org/release/stone_soup-$pkgver-nodeps.tar.xz")
md5sums=('SKIP')

prepare() {
    gendesk -f -n --name "Dungeon Crawl Stone Soup" --pkgname $pkgname --pkgdesc "$pkgdesc"
}

build() {
    cd "$srcdir/stone_soup-$pkgver/source"
    make DESTDIR="$pkgdir" TILES=y SOUND=y prefix="/usr" DATADIR="/usr/share/$pkgname"  CFOPTIMIZE="$CXXFLAGS" SAVEDIR="~/.crawl"
}

package() {
    cd "$srcdir/stone_soup-$pkgver/source"
    make DESTDIR="$pkgdir" TILES=y SOUND=y prefix=/usr DATADIR="/usr/share/$pkgname"  CFOPTIMIZE="$CXXFLAGS" SAVEDIR="~/.crawl" install

    mkdir -p "$pkgdir/usr/bin"
    mv -f "$pkgdir/usr/games/crawl" "$pkgdir/usr/bin/$pkgname"
    rm -rf "$pkgdir/usr/games"

    install -Dm644 dat/tiles/stone_soup_icon-512x512.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    
}

