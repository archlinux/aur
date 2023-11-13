# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=figma-linux
pkgname="${_pkgname}-git"
_pkgver=0.11.0
pkgver=0.11.0.r0.gf5dd5bf
pkgrel=1
pkgdesc="An unofficial Electron-based Figma desktop app,the first interface design tool based in the browser, making it easier for teams to create software."
arch=('any')
url="https://github.com/Figma-Linux/figma-linux"
license=('GPL2')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
depends=(
    'electron27'
    'gtk3'
    'gdk-pixbuf2'
    'libxext'
    'libx11'
    'hicolor-icon-theme'
    'pango'
    'nss'
    'nspr'
    'sqlite'
    'at-spi2-core'
    'systemd-libs'
    'libdbusmenu-glib'
    'libdbusmenu-gtk3'
)
makedepends=(
    'gendesk'
    'git'
    'nodejs>=18.11.18'
    'npm>=9.8.1'
)
source=(
    "${_pkgname}"::"git+${url}.git#tag=v${_pkgver}"
    "${_pkgname}.sh"
)
sha256sums=('SKIP'
            '27b40ca59adaecf65b181228a1afb0c829c34659c62301e823ec6ba6926aa293')
pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --pkgname "${_pkgname}" --categories "Utility" --name="${_pkgname}" --exec="${_pkgname}"
    cd "${srcdir}/${_pkgname}"
    sed -e '62,73d' -e 's|"output": "build/installers"|"output": "out"|g' -i config/builder.json
    npm install --no-frozen-lockfile
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/out/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${_pkgname}/out/linux-unpacked/lib/${CARCH}-linux-gnu/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/lib"
    install -Dm644 "${srcdir}/${_pkgname}/out/linux-unpacked/usr/lib/${CARCH}-linux-gnu/"*.* -t "${pkgdir}/usr/lib/${pkgname%-git}/lib"
    install -Dm644 "${srcdir}/${_pkgname}/out/linux-unpacked/usr/lib/${CARCH}-linux-gnu/nss/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/lib/nss"
    install -Dm644 "${srcdir}/${_pkgname}/out/linux-unpacked/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/swiftshader"
    for _icons in 24x24 36x36 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${_pkgname}/out/linux-unpacked/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/${_pkgname}/out/linux-unpacked/icons/scalable.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}