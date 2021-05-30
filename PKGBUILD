# Maintainer: Rick van Lieshout <info@rickvanlieshout.com>

pkgname=tidal-hifi
pkgver=2.2.1
pkgrel=1
pkgdesc="The web version of listen.tidal.com running in electron with hifi support thanks to widevine."
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
makedepends=(npm)
source=("${pkgname}-${pkgver}.zip::https://github.com/Mastermindzh/tidal-hifi/archive/${pkgver}.zip"
        "tidal-hifi.desktop")
sha512sums=('adf126bb23945deca1f3cc5e50b53422d442096726f6b77c7490fc3fcd6af809502750d1670ef26c7ab019f1b31e6bf8fa59274bdc9a8be6779caa73c7f50cc9'
            'e47dc754a23dbf6f9837275a93cf5868b23abca84b789393d77da855068eb6f63a1d702b4688c315ad3f7c5c09deab5d172566a377807bc56f54dc8a31431495')

prepare() {
    cd "tidal-hifi-${pkgver}"

    # install build dependencies
    npm install
}

build() {
    cd "tidal-hifi-${pkgver}"

    # We are not using the systems Electron as we need castlab's Electron.
    npm run build-arch
}

package() {
    cd "tidal-hifi-${pkgver}"

    install -d "${pkgdir}/opt/tidal-hifi/" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"

    cp -r dist/linux-unpacked/* "${pkgdir}/opt/tidal-hifi/"
    chmod +x "${pkgdir}/opt/tidal-hifi/tidal-hifi"

    ln -s "/opt/tidal-hifi/tidal-hifi" "${pkgdir}/usr/bin/tidal-hifi"

    install -Dm 644 "build/icon.png" "${pkgdir}/usr/share/pixmaps/tidal-hifi.png"
    install -Dm 644 "${srcdir}/tidal-hifi.desktop" "${pkgdir}/usr/share/applications/tidal-hifi.desktop"

    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -dm755 "icon.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/tidal-hifi.png"
    ln -s "/opt/tidal-hifi/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    ln -s "/opt/tidal-hifi/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
