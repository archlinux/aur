# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=he3
pkgname="${_appname}-tools-bin"
_pkgname=He3
pkgver=2.0.20
_electronversion=22
pkgrel=2
pkgdesc="Open, Intelligent, Efficient Developer Toolbox"
arch=(
    'aarch64'
    'x86_64'
)
url="https://he3app.com"
_dlurl="https://he3-1309519128.cos.accelerate.myqcloud.com"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'python>=3'
    'python-setuptools'
    'java-runtime'
    'hicolor-icon-theme'
)
options=(
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/${pkgver}/${_pkgname}_linux_arm64_${pkgver}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/${pkgver}/${_pkgname}_linux_amd64_${pkgver}.deb")
source=(
    "LICENSE-${pkgver}.html::${url}/en/terms"
    "${pkgname%-bin}.sh"
)
sha256sums=('92eb03e0339af737f930be9f3f95fe74ebce8eeca4835fbe7b50dc7c5fa94601'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('f439cd9fe1b60bf407dd0e08ab506c60148f06b7c8e1292ce180c1b1bf4d0d6b')
sha256sums_x86_64=('80788fa9c8606cb6647992e78cceb1c4e529d4a65d764be12cc46fa8977d38c3')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${_appname}|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"

    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}