# Maintainer: Thomas Lercher <aur@tlercher.de>
# Contributor: NiNjA <heinep at gmail dot com>

_pkgname=julius
pkgname=$_pkgname-game-git
pkgdesc="Open source re-implementation of Caesar III (Original copy required)"
pkgver=r2482.9b8c90d2
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/bvschaik/julius"
license=('AGPL')
conflicts=('julius-game')
provides=('julius-game')
makedepends=('git' 'cmake')
depends=('sdl2' 'sdl2_mixer')
source=($_pkgname-game.install git+https://github.com/bvschaik/julius)
sha256sums=('1fb252bf875f459937ddc297295daaa52dfd5fed41fd6c6fe255240d4176e2ea'
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
    sed -i 's/Exec=julius/Exec=julius-game/' ${_pkgname}.desktop
}

package() {
    install -Dm755 "$srcdir/${_pkgname}/build/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}-game"
    install -Dm644 "$srcdir/${_pkgname}/LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkgname}-game/LICENSE"
    install -Dm664 "$srcdir/${_pkgname}/res/${_pkgname}_512.png" "$pkgdir/usr/share/pixmaps/com.github.bvschaik.julius.png"
    install -Dm664 "$srcdir/${_pkgname}/build/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}-game.desktop"
}
