# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shutter-encoder-bin
_pkgname='Shutter Encoder'
pkgver=20.5
pkgrel=1
pkgdesc="Converter for all formats video|audio|image professionnals codecs and standards - swiss knife tool for Linux."
arch=('x86_64')
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
    'ffmpeg'
    '7zip'
    'yt-dlp'
    'mediainfo'
    'dvdauthor'
    'dcraw'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/Shutter%20Encoder%20${pkgver}%20Linux%2064bits.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('191c6e146c8ee1bdfd3fe974ef256e9a8d73fb8ad709e210c3272d09e3d1f162'
            '54c9c369d98cf70616bcdcf091d13bafc63b630f89db8e476512bf6984591cc5')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/
        s/@runname@/${pkgname%-bin}/
    " "${srcdir}/${pkgname%-bin}.sh" > "${srcdir}/${pkgname%-bin}.sh.tmp"
    mv "${srcdir}/${pkgname%-bin}.sh.tmp" "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/bin/${pkgname%-bin}\"$|/bin/${pkgname%-bin}-high-dpi\"|" \
        "${srcdir}/${pkgname%-bin}.sh" > "${srcdir}/${pkgname%-bin}-high-dpi.sh"
    bsdtar -xf "${srcdir}/data."*
    find "${srcdir}" -type d -exec chmod 755 {} \;
    find "${srcdir}" -type f -name "*.*" -perm 777 -exec chmod 644 {} \;
    find "${srcdir}" -type f -perm 777 -exec chmod 755 {} \;
    sed -i -e "
        s|Exec=\"/opt/${pkgname%-bin}/bin/${_pkgname}\"|Exec=/usr/lib/${pkgname%-bin}/bin/${pkgname%-bin}|
        s|Icon=/opt/${pkgname%-bin}/lib/${_pkgname// /_}.png|Icon=${pkgname%-bin}|
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname// /_}.desktop"
    sed -i -e "
        s|Exec=\"/opt/${pkgname%-bin}/bin/${_pkgname} High-DPI\"|Exec=/usr/lib/${pkgname%-bin}/bin/${pkgname%-bin}-high-dpi|
        s|Icon=/opt/${pkgname%-bin}/lib/${_pkgname// /_}_High-DPI.png|Icon=${pkgname%-bin}-high-dpi|
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname// /_}_High-DPI.desktop"
    for _bin in 7za ffmpeg ffprobe mediainfo dcraw dvdauthor; do
        ln -sf "/usr/bin/${_bin}" "${srcdir}/opt/${pkgname%-bin}/lib/app/Library/${_bin}"
    done
    ln -sf "/usr/bin/yt-dlp" "${srcdir}/opt/${pkgname%-bin}/lib/app/Library/yt-dlp_linux"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}-high-dpi.sh" "${pkgdir}/usr/bin/${pkgname%-bin}-high-dpi"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/${pkgname%-bin}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    mv "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${_pkgname}" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${pkgname%-bin}"
    mv "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${_pkgname} High-DPI" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${pkgname%-bin}-high-dpi"
    mv "${pkgdir}/usr/lib/${pkgname%-bin}/lib/app/${_pkgname}.cfg" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/lib/app/${pkgname%-bin}.cfg"
    mv "${pkgdir}/usr/lib/${pkgname%-bin}/lib/app/${_pkgname} High-DPI.cfg" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/lib/app/${pkgname%-bin}-high-dpi.cfg"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname// /_}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname// /_}_High-DPI.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}-high-dpi.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname// /_}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname// /_}_High-DPI.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}-high-dpi.png"
}
