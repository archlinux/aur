# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.22.0
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=(any)
url="https://cozy-labs.github.io/cozy-desktop/"
license=(AGPL3)
depends=(electron5)
makedepends=(nodejs-lts-erbium yarn git node-gyp python)
source=(https://github.com/cozy-labs/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/cozy-labs/${pkgname}/releases/download/v${pkgver}/Cozy-Drive-${pkgver}-x86_64.AppImage
        ${pkgname}.desktop
        ${pkgname}.sh)
sha256sums=('7ecdeb8067fe1b4affaff548e27b9e8548f0b217d2a40cf4cbfa6644c3ecfd36'
            '1bd96eeabac913a521effede8d4fd87343146bd10a2d5d39c5b707fe99e09baa'
            '563edd5a43c7f06080e03bec5f4e46154227f7e163500950ea39ecad466b198a'
            '16200451af0bd1099510da4eeb7bd440ac4db4eda82013f1b3bd58777e04004e')

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
    rm -r "${pkgdir}"/usr/lib/cozy-desktop/inspector
    rm -r "${pkgdir}"/usr/lib/cozy-desktop/regedit

    cd "${srcdir}"
    chmod +x Cozy-Drive-${pkgver}-x86_64.AppImage
    ./Cozy-Drive-${pkgver}-x86_64.AppImage --appimage-extract
    cp -r squashfs-root/usr/share "${pkgdir}"/usr/
    chmod a+rX -R "${pkgdir}"/usr/share

    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
