# Maintainer: Rick van Lieshout <info@rickvanlieshout.com>

_pkgname=tidal-hifi
pkgname="$_pkgname-git"
pkgver=1.3.0
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
sha512sums=('aacd985ba0d3944f43c10a8a82abbbc738ea86870c7bf4c2a51b99e311e44a6ac27eccc7a23c321cfcc5ad56121b749526a6dad0ca59fe2e5cbb76262192bf92'
            '35f38ac308b871c1822d7f6f760f2fb54c3748cf769822cb0f0dfb90f0f5754ba9316da5e903a0d2e9839de3a43ec76f238f3f2e44021956fa1da19142081349')

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
    ln -s "/opt/${_pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    ln -s "/opt/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
