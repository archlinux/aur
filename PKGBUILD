# Maintainer: Zee Yudenko <lubomir dot yudenko at gmail dot com>

pkgname=chips-cctools
_pkgname=cctools
pkgver=3.0
pkgrel=1
pkgdesc="Editor and Tool suite for Chip's Challenge, Chip's Challenge 2, and Tile World"
arch=('x86_64')
url='https://github.com/zrax/cctools'
license=('GPL3')
depends=('qt5-base')
optdepends=('tworld: Tile World playtesting'
            'steam: Steam CC playtesting'
            'wine: MSCC playtesting')
makedepends=('cmake' 'git')
source=("https://github.com/zrax/cctools/releases/download/${pkgver}/cctools-${pkgver}.tar.xz"
        'CC2Edit.desktop'
        'CCEdit.desktop'
        'CCHack.desktop'
        'CCPlay.desktop')
sha256sums=('SKIP'
            'd2b644a68791cc3f4706cf4aaebbd8ebaa74fa8b726ce4e206eb6412861e4cb9'
            'b7c6924afb0b946dfff7af79dfe0e9d7c10591452a99e220795b435416c266f4'
            '95682dffed1d9dbd57874daf40dfac5c62dba809a444afbf32b5ab4da20eb543'
            '09b7c1e4b1632e75cc3060190101e42ffdbc5fbfbae2fbfb68b1fb5b950aec3b')

build() {
    cmake \
        -B "${_pkgname}-${pkgver}/build" \
        -S "${_pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build "${_pkgname}-${pkgver}/build"
    # Hacky rename, since `install` can't automatically rename files
    ln "${_pkgname}-${pkgver}/src/CC2Edit/icons/boot-32.png" "CC2Edit.png"
    ln "${_pkgname}-${pkgver}/src/CCEdit/icons/boot-48.png" "CCEdit.png"
    ln "${_pkgname}-${pkgver}/src/CCHack/icons/sock-48.png" "CCHack.png"
    ln "${_pkgname}-${pkgver}/src/CCPlay/icons/chip-48.png" "CCPlay.png"
}

package() {
    DESTDIR="$pkgdir" cmake --install "${_pkgname}-${pkgver}/build"
    install -D -m644 "${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -D -m644 "CC2Edit.png" -t "${pkgdir}/usr/share/pixmaps"
    install -D -m644 "CCEdit.png" -t "${pkgdir}/usr/share/pixmaps"
    install -D -m644 "CCHack.png" -t "${pkgdir}/usr/share/pixmaps"
    install -D -m644 "CCPlay.png" -t "${pkgdir}/usr/share/pixmaps"
    install -D -m644 "CC2Edit.desktop" -t "${pkgdir}/usr/share/applications"
    install -D -m644 "CCEdit.desktop" -t "${pkgdir}/usr/share/applications"
    install -D -m644 "CCHack.desktop" -t "${pkgdir}/usr/share/applications"
    install -D -m644 "CCPlay.desktop" -t "${pkgdir}/usr/share/applications"
}
