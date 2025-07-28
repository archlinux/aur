# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>

pkgname=cozy-desktop
pkgver=3.43.1
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=(x86_64)
url="https://cozy-labs.github.io/cozy-desktop/"
license=(AGPL-3.0-only)
_electron=electron31
depends=(${_electron})
makedepends=(nodejs yarn git node-gyp python)
source=(https://github.com/cozy-labs/${pkgname}/archive/v${pkgver/b/-beta.}/${pkgname}-${pkgver/b/-beta.}.tar.gz
        Cozy-Drive-${pkgver/b/-beta.}-x86_64.AppImage::https://github.com/cozy-labs/${pkgname}/releases/download/v${pkgver/b/-beta.}/Cozy-Drive-x86_64.AppImage
        ${pkgname}.desktop
        ${pkgname}.sh)
sha256sums=('f4c3a233ea1ef71456e4038baac6f1400aae5d6dbca65863be1d6e483fa77b17'
            'f96f237de1fa795ad1973e219b1413c5e3407a3ea7a0c43aaae270a760043e43'
            '563edd5a43c7f06080e03bec5f4e46154227f7e163500950ea39ecad466b198a'
            'a8783d3f6ce2da344ffe403f8e1a4f9da8de3b59e8bfda10e15a4ff5643244cf')

prepare() {
    # Specify electron version in launcher
    sed -i "s|@ELECTRON@|${_electron}|" ${pkgname}.sh
    cd ${pkgname}-${pkgver/b/-beta.}
    yarn install --no-fund
}

build() {
    cd ${pkgname}-${pkgver/b/-beta.}
    yarn build --offline
}

package() {
    cd ${pkgname}-${pkgver/b/-beta.}
    yarn dist --dir -c.electronDist=/usr/lib/${_electron} -c.electronVersion=$(tail -c +1 /usr/lib/${_electron}/version)

    install -d "${pkgdir}"/usr/lib/${pkgname}
    cp -r dist/linux-unpacked/resources/* "${pkgdir}"/usr/lib/${pkgname}/
    rm -r "${pkgdir}"/usr/lib/cozy-desktop/regedit

    cd "${srcdir}"
    chmod +x Cozy-Drive-${pkgver/b/-beta.}-x86_64.AppImage
    ./Cozy-Drive-${pkgver/b/-beta.}-x86_64.AppImage --appimage-extract
    cp -r squashfs-root/usr/share "${pkgdir}"/usr/
    chmod a+rX -R "${pkgdir}"/usr/share

    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
