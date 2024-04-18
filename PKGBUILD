# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Alexander Jacocks <alexander@redhat.com>
# Contributor: Konrad Malik (https://konradmalik.github.io/)
_pkgname=evernote
pkgname="${_pkgname}-for-linux-bin"
_appname="${_pkgname}-client"
pkgver=10.60.4
_electronversion=19
pkgrel=2
pkgdesc="Official Evernote client for Windows repackaged for Linux"
arch=('x86_64')
url="https://github.com/search5/Evernote-for-Linux"
license=('LicenseRef-custom')
provides=("${_pkgname}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    "electron${_electronversion}"
    'libsecret'
    'perl'
    'nodejs'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}-linux-ddl-ga-stable/${_appname}_${pkgver}-stable_amd64.deb"
    "LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('6465469e3ac3cfeb1ecb3de9b3168713ec2469bf944dfa4d375779e63c2f7476'
            'c88a6b5dfa7faad1e21de4ad78241ef441f6e3d688da2df560f52f3772336978'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" -i "${srcdir}/usr/lib/${_appname}/resources/app/main.js"
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${_appname}/resources/"{app,static} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}