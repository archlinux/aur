# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.33.0
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=(any)
url="https://cozy-labs.github.io/cozy-desktop/"
license=(AGPL3)
_electron=electron12
depends=(${_electron})
makedepends=(nodejs-lts-fermium yarn git node-gyp python)
source=(https://github.com/cozy-labs/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/cozy-labs/${pkgname}/releases/download/v${pkgver}/Cozy-Drive-${pkgver}-x86_64.AppImage
        ${pkgname}.desktop
        ${pkgname}.sh)
sha256sums=('a82325f1183c83888c30bb839b89a2e87e3991a09588c0c4564b33db7a557590'
            '2ecffbfe8d464fc03070d7f320e37b770f7ac4fdb043ab34bdf8211f56fdfa90'
            '563edd5a43c7f06080e03bec5f4e46154227f7e163500950ea39ecad466b198a'
            'a8783d3f6ce2da344ffe403f8e1a4f9da8de3b59e8bfda10e15a4ff5643244cf')

prepare() {
    # Specify electron version in launcher
    sed -i "s|@ELECTRON@|${_electron}|" ${pkgname}.sh
    cd ${pkgname}-${pkgver}
    yarn install --no-fund
}

build() {
    cd ${pkgname}-${pkgver}
    yarn build #--offline disabled https://github.com/cozy-labs/cozy-desktop/issues/2206
}

package() {
    cd ${pkgname}-${pkgver}
    # Using our electron does not work with the same failure as https://github.com/cozy-labs/cozy-desktop/issues/2206
    yarn dist --dir #-c.electronDist=/usr/lib/${_electron} -c.electronVersion=$(tail -c +1 /usr/lib/${_electron}/version)

    install -d "${pkgdir}"/usr/lib/${pkgname}
    cp -r dist/linux-unpacked/resources/* "${pkgdir}"/usr/lib/${pkgname}/

    rm "${pkgdir}"/usr/lib/cozy-desktop/app.asar.unpacked/gui/scripts/macos-add-favorite.py
    rmdir "${pkgdir}"/usr/lib/cozy-desktop/app.asar.unpacked/{gui/{scripts/,},}
    rm -r "${pkgdir}"/usr/lib/cozy-desktop/regedit

    cd "${srcdir}"
    chmod +x Cozy-Drive-${pkgver}-x86_64.AppImage
    ./Cozy-Drive-${pkgver}-x86_64.AppImage --appimage-extract
    cp -r squashfs-root/usr/share "${pkgdir}"/usr/
    chmod a+rX -R "${pkgdir}"/usr/share

    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
