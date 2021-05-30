# Maintainer: Rick van Lieshout <info@rickvanlieshout.com>

_pkgname=tidal-hifi
pkgname="$_pkgname-git"
pkgver=2.2.1
pkgrel=1
pkgdesc="The web version of listen.tidal.com running in electron with hifi support thanks to widevine."
arch=("x86_64")
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")

depends=("libxss" "nss" "gtk3")
makedepends=("npm" "git")
provides=("$_pkgname")

source=("https://github.com/Mastermindzh/tidal-hifi/archive/$pkgver.zip"
        "${_pkgname}.desktop")
sha512sums=('adf126bb23945deca1f3cc5e50b53422d442096726f6b77c7490fc3fcd6af809502750d1670ef26c7ab019f1b31e6bf8fa59274bdc9a8be6779caa73c7f50cc9'
            'd7e283e841aa0ba8189d56c090f01aaa7fe2b187756a6d037d1412e698ff586aef45698c5cb89c36fe22f403885060e65fef98be9f8807ac1e6878d8fca686eb')

cdToPkg(){
    cd "tidal-hifi-$pkgver"
}

prepare() {
    cdToPkg

    # install build dependencies
    npm install
}

build() {
    cdToPkg

    # We are not using the systems Electron as we need castlab's Electron.
    npm run build-arch
}

package() {
    cdToPkg

    install -d "${pkgdir}/opt/${_pkgname}/" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"

    cp -r dist/linux-unpacked/* "${pkgdir}/opt/${_pkgname}/"
    chmod +x "${pkgdir}/opt/${_pkgname}/${_pkgname}"

    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm 644 "build/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm 644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -dm755 "icon.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/tidal-hifi.png"
    ln -s "/opt/${_pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    ln -s "/opt/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
