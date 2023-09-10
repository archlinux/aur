# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shutter-encoder-bin
_pkgname="Shutter Encoder"
pkgver=17.4
pkgrel=1
pkgdesc="Converter for all formats video|audio|image professionnals codecs and standards - swiss knife tool for Linux"
arch=("x86_64")
url="https://www.shutterencoder.com"
_githuburl="https://github.com/paulpacifico/shutter-encoder"
license=("GPL3")
depends=('zlib' 'glibc' 'bash' 'gcc-libs' 'libxml2' 'libxtst' 'freetype2' 'libjpeg-turbo' 'libxi' 'libxrender' 'libx11' \
    'libxext' 'perl' 'util-linux-libs' 'lcms2' 'libbsd' 'alsa-lib' 'java-runtime' 'ffmpeg' 'vulkan-icd-loader')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/Shutter%20Encoder%20${pkgver}%20Linux%2064bits.deb")
sha256sums=('d5fc4aa6114c2dde3de6c988997f37dcfed37ebb1669be2fc3fb7a5c6f354f68')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    find "${srcdir}" -type d -exec chmod 755 {} \;
    find "${srcdir}" -type f -name "*.*" -perm 777 -exec chmod 644 {} \;
    find "${srcdir}" -type f -perm 777 -exec chmod 755 {} \;
    sed "s|\"/usr/lib/${_pkgname}/AppRun\"|/opt/${pkgname%-bin}/AppRun|g" -i "${srcdir}/usr/lib/${_pkgname}/${pkgname%-bin}"
    sed "s|/usr/lib/${_pkgname}/usr/bin/icon.png|${pkgname%-bin}|g;s|Exec=${pkgname%-bin}|Exec=${pkgname%-bin} --no-sandbox %U|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname// /_}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/usr/lib/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/AppRun" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname// /_}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/usr/bin/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}