# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=js.design
pkgname="${_pkgname//./-}-electron-bin"
pkgver=1.0.2
_electronversion=15
pkgrel=2
pkgdesc="即时设计 A professional UI design software tailored for Chinese designers."
arch=(
    'aarch64'
    'x86_64'
)
url="https://js.design"
license=("LicenseRef-custom")
conflicts=("${_pkgname//./-}")
depends=(
    "electron${_electronversion}-bin"
)
source_aarch64=("${_pkgname//./-}-${pkgver}-aarch64.deb::https://img.js.design/assets/download/%E7%BB%9F%E4%BF%A1UOS/%E5%8D%B3%E6%97%B6%E8%AE%BE%E8%AE%A1_arm64.deb")
source_x86_64=("${_pkgname//./-}-${pkgver}-x86_64.deb::https://img.js.design/assets/download/%E7%BB%9F%E4%BF%A1UOS/%E5%8D%B3%E6%97%B6%E8%AE%BE%E8%AE%A1_amd64.deb")
source=(
    "LICENSE.html::${url}/terms"
    "${pkgname%-bin}.sh"
)
sha256sums=('61e4aa3720bf8615c90c0dc61cdbd70bf3ba4e24bf8cd7dc767f92eba657a0d5'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('f64ce56620709aa4d25273495ce62b111c1be1a5f94b9fc88d2f36ad8c0d12d9')
sha256sums_x86_64=('748132bf033dcdec2af34fc4bc637fcfed547ce0e4f332a0b46bb00717ac95ec')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|\"\/opt\/apps\/design.js.jsdesign\/files\/js.design\" --no-sandbox|${pkgname%-bin}|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/design.js.${_pkgname//./}/entries/applications/${_pkgname}.desktop"
}    
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/design.js.${_pkgname//./}/files/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/design.js.${_pkgname//./}/files/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/opt/apps/design.js.${_pkgname//./}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/opt/apps/design.js.${_pkgname//./}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}