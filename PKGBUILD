# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.31.0
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=(any)
url="https://cozy-labs.github.io/cozy-desktop/"
license=(AGPL3)
_electron=electron12
depends=(${_electron})
makedepends=(nodejs-lts-gallium yarn git node-gyp python)
source=(https://github.com/cozy-labs/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/cozy-labs/${pkgname}/releases/download/v${pkgver}/Cozy-Drive-${pkgver}-x86_64.AppImage
        ${pkgname}.desktop
        ${pkgname}.sh)
sha256sums=('c36aa1556dde01a97c0603168af3374dfcdec7ab6b2cf5ee3c4016aabe1fb0e4'
            '97ce06f9822ba2d540c4e07422c905629807e46ceedcf8ce7d3231bbce8255d9'
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
    yarn build --offline
}

package() {
    cd ${pkgname}-${pkgver}
    yarn dist --dir

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
