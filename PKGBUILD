# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=antares-sql-bin
_appname=Antares
pkgver=0.7.16
pkgrel=1
pkgdesc="A modern, fast and productivity driven SQL client with a focus in UX."
arch=("aarch64" "armv7h" "x86_64")
url="https://antares-sql.app/"
_githuburl="https://github.com/antares-sql/antares"
license=("MIT")
depends=('bash' 'hicolor-icon-theme' 'electron22')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/antares-sql/antares/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('7b960bb0bed7d2228b6a8a879558c97906cc041ab14ab1d1089959902f386613'
            'd91cbdd0be18fd645e8e826b2b31b3a01911d76138241b1ac0a1051fb8209a6b')
sha256sums_aarch64=('57f6561fa0275bf38da2650fa9b6f78a951b9b027d84cf7c92368e5841a4536e')
sha256sums_armv7h=('7223fa244433a60c8e674cccc8e868b5bf08f8be7ff8b44cfb672ebacb10bae6')
sha256sums_x86_64=('a5b36802991ea51eb6a358ec3e5496045d7290219a5d59c9cd726b8eca2c924c')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar extract "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/app.asar.unpacked/node_modules/better-sqlite3/build/node_gyp_bins/python3" \
        "${srcdir}/app.asar.unpacked/node_modules/cpu-features/build/node_gyp_bins/python3"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|/opt/${_appname}/${pkgname%-sql-bin} %U|${pkgname%-bin}|g;s|Icon=${pkgname%-sql-bin}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-sql-bin}.desktop"
}
package() {    
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-sql-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-sql-bin}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}