# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apifox-bin
_pkgname=Apifox
pkgver=2.5.3
_electronversion=22
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=(
    'aarch64'
    'x86_64'
)
url="https://apifox.com/"
_ghurl="https://github.com/apifox/apifox"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'java-runtime'
    'nodejs'
    'lib32-glibc'
    'lib32-gcc-libs'
)
options=(
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::https://cdn.apifox.cn/download/${_pkgname}-linux-arm64-deb-latest.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::https://cdn.apifox.cn/download/${_pkgname}-linux-deb-latest.zip")
source=(
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('3884df6451dd5aaadc867c2b6882a7feabccb10c7e1df98e48e9fe2414c9fe19'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
sha256sums_aarch64=('bfedd899ae5776f044af046ea978f851aada1e4082d396e7664569726f6108ee')
sha256sums_x86_64=('c26d9439b813fc1472c016ab580fdb839ff6b803883cac9fe1751623c975c52a')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/${pkgname%-bin}_"*.deb
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g;s|Utility|Development|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}