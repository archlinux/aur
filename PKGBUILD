# Maintainer: Harish Rajagopal <harish dot rajagopals at gmail dot com>
# Contributor: Madeline Mewmews <maddie at mewmews dot gay>
# Contributor: bemxio <bemxiov at protonmail dot com>
# Contributor: Harrison <htv04rules at gmail dot com>

pkgname=sm64coopdx
pkgver=1.5.1
pkgrel=2
pkgdesc="Fork of Super Mario 64 Co-op with more features, customizability and power to the Lua API"
url="https://sm64coopdx.com/"
license=("LicenseRef-unknown")
arch=(x86_64 i686 pentium4 aarch64 armv7h)
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")
depends=(sdl2)
makedepends=("python>=3.6"
             glew
             zlib
             curl
             audiofile
             gendesk)
source=("https://github.com/coop-deluxe/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.sh")
md5sums=('d7751a9eb4eec1228f41ce40e3c140cc'
         '314f0815dc7132df21bbd3a9d391f2be')

prepare() {
    gendesk -f -n \
        --pkgname "Super Mario 64 Co-op Deluxe" \
        --pkgdesc "${pkgdesc}" \
        --exec "${pkgname}" \
        --icon "${pkgname}.png" \
        --categories "Game;ActionGame;AdventureGame"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build/us_pc"

    # copy game executable
    install -Dm755 "${pkgname}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"

    # copy shared libraries
    find . -type f -name '*.so' -exec install -Dm755 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;

    # copy other game directories
    find lang -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;
    find dynos -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;
    find mods -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;

    # copy executable script
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # copy icon and desktop entry
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/res/icon.icon/Assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/Super Mario 64 Co-op Deluxe.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
