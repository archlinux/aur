# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=station-bin
_pkgname=Station
pkgver=3.2.0
_electronversion=27
pkgrel=1
pkgdesc="The first open-source smart browser for busy people. A single place for all of your web applications.Prebuilt version.Use system-wide electron."
arch=('x86_64')
url="https://getstation.com/"
_ghurl="https://github.com/getstation/desktop-app"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('607c5f936a2e6b1d0f4d973be54a9a2329db4306dbd637e63086b0eba93a8e06'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}v2/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\/opt\/${_pkgname}\/${pkgname%-bin}-desktop-app/${pkgname%-bin}/g
        s/${pkgname%-bin}-desktop-app/${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}-desktop-app.desktop"
    find "${srcdir}/opt/${_pkgname}/resources" -type d -exec chmod 755 {} \;
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,.env.production,app-update.yml,icon.png} \
        "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-desktop-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-desktop-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}