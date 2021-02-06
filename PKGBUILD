# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.25.0
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=(any)
url="https://cozy-labs.github.io/cozy-desktop/"
license=(AGPL3)
depends=(electron)
makedepends=(nodejs-lts-erbium yarn git node-gyp python)
source=(https://github.com/cozy-labs/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/cozy-labs/${pkgname}/releases/download/v${pkgver}/Cozy-Drive-${pkgver}-x86_64.AppImage
        ${pkgname}.desktop
        ${pkgname}.sh)
sha256sums=('dcd084f72fce700e67772abf14f59ae1bc7e3d73fac4476e03c8a317702dcac3'
            '928cb642345ff9a4014db734647be70a5076bcc78665e0b87339804a48609e9e'
            '563edd5a43c7f06080e03bec5f4e46154227f7e163500950ea39ecad466b198a'
            '4a4b83e818b6dd9143680b630d4aaa3a29c409c31e19c958ecf5dc7051604831')

prepare() {
    cd ${pkgname}-${pkgver}
    yarn install
}

build() {
    cd ${pkgname}-${pkgver}
    yarn build
}

package() {
    cd ${pkgname}-${pkgver}
    yarn dist --dir

    install -d "${pkgdir}"/usr/lib/${pkgname}
    cp -r dist/linux-unpacked/resources/* "${pkgdir}"/usr/lib/${pkgname}/

    rm "${pkgdir}"/usr/lib/cozy-desktop/app.asar.unpacked/gui/scripts/macos-add-favorite.py
    rmdir "${pkgdir}"/usr/lib/cozy-desktop/app.asar.unpacked/gui/{scripts/,}
    rm -r "${pkgdir}"/usr/lib/cozy-desktop/regedit

    cd "${srcdir}"
    chmod +x Cozy-Drive-${pkgver}-x86_64.AppImage
    ./Cozy-Drive-${pkgver}-x86_64.AppImage --appimage-extract
    cp -r squashfs-root/usr/share "${pkgdir}"/usr/
    chmod a+rX -R "${pkgdir}"/usr/share

    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
