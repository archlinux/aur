# Maintainer: Thomas Lercher <aur@tlercher.de>
# Contributor: NiNjA <heinep at gmail dot com>

_pkgname=augustus
pkgname=$_pkgname-game-git
pkgdesc="An enhanced re-implementation of Caesar III (Original copy required)"
pkgver=r2389.c06d5257
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/Keriew/augustus"
license=('AGPL')
conflicts=('augustus-game')
provides=('augustus-game')
makedepends=('git' 'cmake')
depends=('sdl2' 'sdl2_mixer')
source=($_pkgname-game.install git+https://github.com/Keriew/augustus)
sha256sums=('a13556dff5011df049ec64964db94f6cfcdc0e5fb18801e190af0a95b840af75'
            'SKIP')

pkgver() {
    cd "${_pkgname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/${_pkgname}"
    mkdir -p build && cd build
    cmake ..
    make
    cp ../res/${_pkgname}.desktop .
    sed -i 's/Exec=augustus/Exec=augustus-game/' ${_pkgname}.desktop
}

package() {
    install -Dm755 "$srcdir/${_pkgname}/build/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}-game"
    install -Dm644 "$srcdir/${_pkgname}/LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkgname}-game/LICENSE"
    install -Dm664 "$srcdir/${_pkgname}/res/${_pkgname}_512.png" "$pkgdir/usr/share/pixmaps/com.github.keriew.augustus.png"
    install -Dm664 "$srcdir/${_pkgname}/build/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}-game.desktop"
}
