# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netpad-bin
_pkgname=NetPad
pkgver=0.7.0
_electronversion=23
pkgrel=1
pkgdesc="A cross-platform C# editor and playground."
arch=('x86_64')
url="https://github.com/tareqimbasher/NetPad"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'dotnet-sdk'
)
optdepends=(
    'aspnet-runtime: ASP.NET Support'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.pacman"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tareqimbasher/NetPad/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('cb0c2c9efb51bc2ea74ddaf245f873a1a356f6960a8fd9bb9d464f519b4a369a'
            '43485534798b716310ae2a0edeebb00e97ff0e42e5fde13ff2994e2bc82348f6'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/bin" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}