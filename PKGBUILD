# Maintainer: Thomas Lercher <aur@tlercher.de>
# Contributor: NiNjA <heinep at gmail dot com>

_pkgname=augustus
pkgname=$_pkgname-game-git
pkgdesc="An enhanced re-implementation of Caesar III (Original copy required)"
pkgver=r3879.e7ef0470
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/Keriew/augustus"
license=('AGPL')
conflicts=('augustus-game')
provides=('augustus-game')
makedepends=('git' 'cmake')
depends=('sdl2' 'sdl2_mixer' 'libpng')
install="${_pkgname}-game.install"
source=($_pkgname-game.desktop $_pkgname-game.install git+https://github.com/Keriew/augustus)
sha256sums=('52fd21bbd8a32cee21399c598283dfea11fa507e01e92c8344fb6e021fae0928'
            'd0d9e1fdfa9edbb22239d55612c8b7ffdb501a1cfebea82cce2ccf4259f867ef'
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
