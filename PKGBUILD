# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shutter-encoder-bin
_pkgname="Shutter Encoder"
pkgver=17.7
pkgrel=1
pkgdesc="Converter for all formats video|audio|image professionnals codecs and standards - swiss knife tool for Linux"
arch=("x86_64")
url="https://www.shutterencoder.com"
_ghurl="https://github.com/paulpacifico/shutter-encoder"
license=("GPL3")
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
    'java-runtime'
    'ffmpeg'
    'vulkan-icd-loader'
)
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/Shutter%20Encoder%20${pkgver}%20Linux%2064bits.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9d1d28f535b3873f8e094c0335f7ec3dcd3e4f0171d6311dbcec0036bdff999a'
            '0d831c86948761209c2a110c4481ecebddb952ba04a686346a6fc0449f18e98e')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    find "${srcdir}" -type d -exec chmod 755 {} \;
    find "${srcdir}" -type f -name "*.*" -perm 777 -exec chmod 644 {} \;
    find "${srcdir}" -type f -perm 777 -exec chmod 755 {} \;
    sed "s|\"/usr/lib/${_pkgname}/AppRun\"|/opt/${pkgname%-bin}/AppRun|g" -i "${srcdir}/usr/lib/${_pkgname}/${pkgname%-bin}"
    sed "s|/usr/lib/${_pkgname}/usr/bin/icon.png|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_pkgname// /_}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname// /_}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/usr/bin/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}