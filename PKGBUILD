# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apifox-bin
_pkgname=Apifox
pkgver=2.5.12
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
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('379fb4d37f4fa27d025ee288614d8f179acb54b50aa96156791598aa13a517b5')
sha256sums_x86_64=('f838e4d7d2f3218f9f9cb5ba23b510c8c5105772031e046d20447fd32c6c4298')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/${pkgname%-bin}_"*.deb
    bsdtar -xf "${srcdir}/data."*
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