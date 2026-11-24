# Maintainer: Burek <zaludjenik@hotmail.com>
# Native Linux port of Drug Lord 2 (SDL2).
#
# Keep this file and druglord2-port.tar.gz together in one folder, then run
#     makepkg -si
# in that folder. Nothing else is needed: the package downloads druglord2.exe
# from the author's own site (checked against a SHA-256), builds the port from
# the tarball, extracts the game data from the exe and installs everything
# under /usr. After that the game runs on its own: the exe is only needed
# while building. Remove it again with
#     sudo pacman -R druglord2
#
# Original game: Drug Lord 2 by Fred Bulback, Geek Hideout
# (http://www.geekhideout.com/druglord2.shtml). All credit for the game and its
# assets belongs to its author.
#
# This package does not contain the game's data or the exe: both are fetched
# from the author's site on the machine that builds it.

pkgname=druglord2
pkgver=1.0
pkgrel=1
pkgdesc='Native Linux port of Drug Lord 2 by Fred Bulback (Geek Hideout)'
url='http://www.geekhideout.com/druglord2.shtml'
arch=('x86_64')
license=('custom')
depends=('sdl2' 'sdl2_ttf' 'fontconfig' 'ttf-liberation')
makedepends=('gcc' 'make' 'python')
options=('!debug')
source=('druglord2-port.tar.gz::https://github.com/BurekOne/druglord2-linux/releases/download/v1.0/druglord2-port.tar.gz'
        'druglord2.exe::http://www.geekhideout.com/downloads/druglord2.exe')
noextract=('druglord2.exe')
sha256sums=('5133af95c50eb07fd504640b31772cb588696ae0c03e9ee8bc59d5cf5a53701f'
            '187515f94d434567c58ecee5ced5c909c3fa6a0cb5054f81987ddb04be5aa5fb')

prepare() {
    cd "$srcdir/port"
    rm -rf build data
    python3 tools/extract_assets.py "$srcdir/druglord2.exe" data
}

build() {
    cd "$srcdir/port"
    make
}

package() {
    cd "$srcdir/port"
    make install DESTDIR="$pkgdir" PREFIX=/usr
}
