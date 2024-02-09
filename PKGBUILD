# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shutter-encoder-bin
_pkgname="Shutter Encoder"
pkgver=17.9
pkgrel=1
pkgdesc="Converter for all formats video|audio|image professionnals codecs and standards - swiss knife tool for Linux"
arch=("x86_64")
url="https://www.shutterencoder.com"
_ghurl="https://github.com/paulpacifico/shutter-encoder"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libxml2'
    'libxtst'
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
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/Shutter%20Encoder%20${pkgver}%20Linux%2064bits.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('0bf9177a5b439178c562a53886f10a2d1358f25698519e456257ae6710314f43'
            '45e0b529e80ab7b75cc4addeab86cd52f96c07b3ea70de527085e310490240e2')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    find "${srcdir}" -type d -exec chmod 755 {} \;
    find "${srcdir}" -type f -name "*.*" -perm 777 -exec chmod 644 {} \;
    find "${srcdir}" -type f -perm 777 -exec chmod 755 {} \;
    sed "s|\"/usr/lib/${_pkgname}/AppRun\"|/opt/${pkgname%-bin}/AppRun|g" -i "${srcdir}/usr/lib/${_pkgname}/${pkgname%-bin}"
    sed "s|/usr/lib/${_pkgname}/usr/bin/icon.png|${pkgname%-bin}|g;s|/usr/share/icons/hicolor/256x256/apps/icon|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname// /_}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname// /_}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/usr/bin/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}