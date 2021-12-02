# Maintainer: Rick van Lieshout <info@rickvanlieshout.com>

pkgname=tidal-hifi
pkgver=2.4.0
pkgrel=1
pkgdesc="The web version of listen.tidal.com running in electron with hifi support thanks to widevine."
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
makedepends=(npm)
source=("${pkgname}-${pkgver}.zip::https://github.com/Mastermindzh/tidal-hifi/archive/${pkgver}.zip"
        "tidal-hifi.desktop")
sha512sums=('de91b8d8c71af56c3d8d15f4ddcd32ff62f5b85ded730354774e4835d983264f40dd7eb291365effa45c39ddd945b34d010f64a62f985db6edb299af0452a161'
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
