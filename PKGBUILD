# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=he3
pkgname="${_appname}-tools-bin"
_pkgname=He3
pkgver=2.0.20
_electronversion=22
pkgrel=1
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
    'nodejs'
    'python>=3'
    'python-setuptools'
    'java-runtime'
    'nss'
    'hicolor-icon-theme'
    'gtk3'
    'alsa-lib'
)
options=('!strip')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/${pkgver}/${_pkgname}_linux_arm64_${pkgver}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/${pkgver}/${_pkgname}_linux_amd64_${pkgver}.deb")
source=(
    "LICENSE-${pkgver}.html::${url}/en/terms"
)
sha256sums=('0b086ae5efee6de2671fc31402003016ab52360bdc9333e9c1dfe05c8471a1db')
sha256sums_aarch64=('f439cd9fe1b60bf407dd0e08ab506c60148f06b7c8e1292ce180c1b1bf4d0d6b')
sha256sums_x86_64=('80788fa9c8606cb6647992e78cceb1c4e529d4a65d764be12cc46fa8977d38c3')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${_appname}|${pkgname%-bin} --no-sandbox|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}