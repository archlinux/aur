# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=swesence-bin
_pkgname=Swesence
pkgver=1.0.0
_electronversion=20
pkgrel=7
pkgdesc="Show your Nintendo Switch activity to Discord using Rich Presence"
arch=("x86_64")
url="https://github.com/glitchcodes/Swesence"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'java-runtime'
    'python>=3'
    'python-setuptools'
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/glitchcodes/Swesence/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('0f81bb4918b95dc6b0eb0fa4c69d2db51082cf75f0f124707e64aaef10bc1e85'
            'a5dee15a267db7d60b958f60d957f9cbdc28cf64e8f5ada0e28ecdafda4ca4bd'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}