# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shutter-encoder-bin
_pkgname='Shutter Encoder'
pkgver=18.9
pkgrel=1
pkgdesc="Converter for all formats video|audio|image professionnals codecs and standards - swiss knife tool for Linux.(Prebuilt version)"
arch=("x86_64")
url="https://www.shutterencoder.com"
_ghurl="https://github.com/paulpacifico/shutter-encoder"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libxml2'
    'freetype2'
    'libjpeg-turbo'
    'libxi'
    'libxrender'
    'libx11'
    'libxext'
    'perl'
    'util-linux-libs'
    'lcms2'
    'libbsd'
    'alsa-lib'
    'vulkan-icd-loader'
    'libxtst'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/Shutter%20Encoder%20${pkgver}%20Linux%2064bits.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('8b4c8482b7d5b6d3b540f815d3523d0d4a3b3051111a93123e44426b7c5ed895'
            'a81897397409f2d750ead9f53f7cded8bffbb765da2305dea006d2fb4fcd2b1d')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/
        s/@runname@/${pkgname%-bin}/
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    find "${srcdir}" -type d -exec chmod 755 {} \;
    find "${srcdir}" -type f -name "*.*" -perm 777 -exec chmod 644 {} \;
    find "${srcdir}" -type f -perm 777 -exec chmod 755 {} \;
    sed -i "s/\"\/usr\/lib\/${_pkgname}\/AppRun\"/\/usr\/lib\/${pkgname%-bin}\/AppRun/g" "${srcdir}/usr/lib/${_pkgname}/${pkgname%-bin}"
    sed -i -e "
        s/\/usr\/lib\/${_pkgname}\/usr\/bin\/icon.png/${pkgname%-bin}/g
        s/\/usr\/share\/icons\/hicolor\/256x256\/apps\/icon/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname// /_}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname// /_}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/usr/bin/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
