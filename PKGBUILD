# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.36.0
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=(x86_64)
url="https://cozy-labs.github.io/cozy-desktop/"
license=(AGPL3)
_electron=electron
depends=(${_electron})
makedepends=(nodejs-lts-fermium yarn git node-gyp python)
source=(https://github.com/cozy-labs/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/cozy-labs/${pkgname}/releases/download/v${pkgver}/Cozy-Drive-${pkgver}-x86_64.AppImage
        ${pkgname}-fix-native-unpacking.patch::https://github.com/cozy-labs/cozy-desktop/pull/2253.patch
        ${pkgname}.desktop
        ${pkgname}.sh)
sha256sums=('adcf47613b9d64669d5da39657dce541643f1b5fa15a2f81a80793ad3f6458b7'
            '75a0b65ae44095a900dce4097fece8ac0aad70a64e71341bebcd2caecd65c7f1'
            '77a123b0ecc1de242d6bbdc1e355339535599e4e3654c067ecbc35bbdeb36d43'
            '563edd5a43c7f06080e03bec5f4e46154227f7e163500950ea39ecad466b198a'
            'a8783d3f6ce2da344ffe403f8e1a4f9da8de3b59e8bfda10e15a4ff5643244cf')

prepare() {
    # Specify electron version in launcher
    sed -i "s|@ELECTRON@|${_electron}|" ${pkgname}.sh
    cd ${pkgname}-${pkgver}
    patch -p1 < ../${pkgname}-fix-native-unpacking.patch
    yarn install --no-fund
}

build() {
    cd ${pkgname}-${pkgver}
    yarn build --offline
}

package() {
    cd ${pkgname}-${pkgver}
    yarn dist --dir -c.electronDist=/usr/lib/${_electron} -c.electronVersion=$(tail -c +1 /usr/lib/${_electron}/version)

    install -d "${pkgdir}"/usr/lib/${pkgname}
    cp -r dist/linux-unpacked/resources/* "${pkgdir}"/usr/lib/${pkgname}/
    rm -r "${pkgdir}"/usr/lib/cozy-desktop/regedit

    cd "${srcdir}"
    chmod +x Cozy-Drive-${pkgver}-x86_64.AppImage
    ./Cozy-Drive-${pkgver}-x86_64.AppImage --appimage-extract
    cp -r squashfs-root/usr/share "${pkgdir}"/usr/
    chmod a+rX -R "${pkgdir}"/usr/share

    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
