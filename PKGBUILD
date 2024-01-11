# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spacemesh-bin
_pkgname=Spacemesh
pkgver=1.3.1
_electronversion=25
pkgrel=1
pkgdesc="Spacemesh App (Smesher + Wallet)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://spacemesh.io/"
_ghurl="https://github.com/spacemeshos/smapp"
_downurl="https://storage.googleapis.com/smapp"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'ocl-icd'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_downurl}/v${pkgver}/${pkgname%-bin}_app_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_downurl}/v${pkgver}/${pkgname%-bin}_app_${pkgver}_amd64.deb")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('d4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
sha256sums_aarch64=('984a74ca17d94c927a40c05d4080ac3ba77e9aa70ddb0e7e0b13caf848c7374d')
sha256sums_x86_64=('1d1f1e02db64b1935fc396e5a478e9113890fd65aedba023e3d495aaba9411b7')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}_app|${pkgname%-bin}|g;s|${pkgname%-bin}_app|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}_app.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/resources" "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/node" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}_app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}_app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}