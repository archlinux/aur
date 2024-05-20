# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=freeciv
pkgname=freeciv-git
pkgver=r30957.e43360ff51
pkgrel=1
pkgdesc="A multiuser clone of the famous Microprose game of Civilization"
arch=('x86_64')
url="http://www.freeciv.org/"
license=('GPL-2.0-or-later')
depends=('curl' 'gtk4' 'lua' 'qt6-base' 'sdl2_gfx' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'sqlite')
makedepends=('git' 'meson' 'intltool')
conflicts=('freeciv' 'freeciv-sdl2')
provides=('freeciv')
source=("git+https://github.com/freeciv/freeciv.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_basename}

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export CFLAGS=${CFLAGS/FORTIFY_SOURCE=2/FORTIFY_SOURCE=0}

    arch-meson ${_basename} build \
        -Dclients=gtk4,qt,sdl2 \
        -Dfcmp=cli,gtk4,qt \
        -Dqtver=qt6 \
        -Dsyslua=true

    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
}
