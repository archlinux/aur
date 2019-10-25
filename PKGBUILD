# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.16.0
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=(any)
url="https://cozy-labs.github.io/cozy-desktop/"
license=(AGPL3)
depends=(electron5)
makedepends=(nodejs-lts-carbon yarn git node-gyp python2)
source=("https://github.com/cozy-labs/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/cozy-labs/${pkgname}/releases/download/v${pkgver}/Cozy-Drive-${pkgver}-x86_x64.AppImage"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('0dce740866cf29d4aee254400c52465ac7bd23297f336fdd180259cc3e91f544'
            '074bb3b392e8556a3d3f962739c86f5ce06a8f8ab932489447797a0472374c05'
            '563edd5a43c7f06080e03bec5f4e46154227f7e163500950ea39ecad466b198a'
            '6915fe8b5771cfcb23970fbd78e07edb6ca364ba336fc3aa790de693d3ade16c')

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
    cp -r dist/linux-unpacked/resources "${pkgdir}"/usr/lib/${pkgname}/

    rm "${pkgdir}"/usr/lib/cozy-desktop/resources/app.asar.unpacked/gui/scripts/macos-add-favorite.py
    rmdir "${pkgdir}"/usr/lib/cozy-desktop/resources/app.asar.unpacked/gui/{scripts/,}
    rm -r "${pkgdir}"/usr/lib/cozy-desktop/resources/inspector

    cd "${srcdir}"
    chmod +x Cozy-Drive-${pkgver}-x86_x64.AppImage
    ./Cozy-Drive-${pkgver}-x86_x64.AppImage --appimage-extract
    cp -r squashfs-root/usr/share "${pkgdir}"/usr/
    chmod a+rX -R "${pkgdir}"/usr/share

    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
