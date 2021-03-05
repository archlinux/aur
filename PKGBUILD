# Maintainer: Thomas Lercher <aur@tlercher.de>
# Contributor: NiNjA <heinep at gmail dot com>

_pkgname=augustus
pkgname=$_pkgname-game-git
pkgdesc="An enhanced re-implementation of Caesar III (Original copy required)"
pkgver=r3127.fe833c2b
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/Keriew/augustus"
license=('AGPL')
conflicts=('augustus-game')
provides=('augustus-game')
makedepends=('git' 'cmake')
depends=('sdl2' 'sdl2_mixer' 'libpng')
source=($_pkgname-game.desktop $_pkgname-game.install git+https://github.com/Keriew/augustus)
sha256sums=('52fd21bbd8a32cee21399c598283dfea11fa507e01e92c8344fb6e021fae0928'
            '03467d55f4314a46ad3c8e6b16e689f36772969c42869823c175b01e6f6392c7'
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
}

package() {
    install -Dm755 "$srcdir/${_pkgname}/build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}-game"
    install -Dm644 "$srcdir/${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}-game/LICENSE"
    install -Dm664 "$srcdir/${_pkgname}/res/${_pkgname}_48.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}_game48.png"
    install -Dm664 "$srcdir/${_pkgname}/res/${_pkgname}_256.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}_game256.png"
    install -Dm664 "$srcdir/${_pkgname}/res/${_pkgname}_512.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-game.png"
    install -Dm664 "${_pkgname}-game.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-game.desktop"

    # Install additional folders to /opt
    install -m 775 -d "${pkgdir}/opt/${_pkgname}-game"
    install -m 775 -d "${pkgdir}/opt/${_pkgname}-game/assets"
    install -m 775 -d "${pkgdir}/opt/${_pkgname}-game/res/maps"
    cp -r "$srcdir/${_pkgname}/assets" "${pkgdir}/opt/${_pkgname}-game/"
    cp -r "$srcdir/${_pkgname}/res/maps" "${pkgdir}/opt/${_pkgname}-game/res/"
}
