# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.36.1
pkgrel=2
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=(x86_64)
url="https://cozy-labs.github.io/cozy-desktop/"
license=(AGPL3)
_electron=electron19
depends=(${_electron})
makedepends=(nodejs-lts-fermium yarn git node-gyp python)
source=(https://github.com/cozy-labs/${pkgname}/archive/v${pkgver/b/-beta.}/${pkgname}-${pkgver/b/-beta.}.tar.gz
        https://github.com/cozy-labs/${pkgname}/releases/download/v${pkgver/b/-beta.}/Cozy-Drive-${pkgver/b/-beta.}-x86_64.AppImage
        ${pkgname}.desktop
        ${pkgname}.sh)
sha256sums=('929157b92d1caa0d1b927c098e26bb5c1a9fdd5f1eacfdf557c0d67423f1f7f7'
            '9ddd7914662b1f3fcd1d1d386af10a717263b76ea626e8a9ab1d722dbc192e4b'
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
