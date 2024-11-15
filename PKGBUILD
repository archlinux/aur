# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>

pkgname=cozy-desktop
pkgver=3.41.0
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=(x86_64)
url="https://cozy-labs.github.io/cozy-desktop/"
license=(AGPL-3.0-only)
_electron=electron31
depends=(${_electron})
makedepends=(nodejs yarn git node-gyp python)
source=(https://github.com/cozy-labs/${pkgname}/archive/v${pkgver/b/-beta.}/${pkgname}-${pkgver/b/-beta.}.tar.gz
        https://github.com/cozy-labs/${pkgname}/releases/download/v${pkgver/b/-beta.}/Cozy-Drive-${pkgver/b/-beta.}-x86_64.AppImage
        ${pkgname}.desktop
        ${pkgname}.sh)
sha256sums=('eb8b7eea6d36ce8ce478cc332c8b65767992461b108eba57df869668f5c8f5c3'
            '70d8ebe90a73ba0552492d50acbf8ac14e55d0a01cba97b365920842e1c1202f'
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
