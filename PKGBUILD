# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shutter-encoder-bin
_pkgname='Shutter Encoder'
pkgver=20.2
pkgrel=1
pkgdesc="Converter for all formats video|audio|image professionnals codecs and standards - swiss knife tool for Linux.(Prebuilt version)"
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
sha256sums=('bafb62f3b622387fac121ae745d0e020bb8bf328d3c43b18f49a00a869e7dac2'
            'd2e12cd239e05ceca84f310de6b1d6beae419d4015f112ca82f830e128e38964')
prepare() {
    # Create normal launcher
    sed -e "
        s/@appname@/${pkgname%-bin}/
        s/@runname@/${pkgname%-bin}/
    " "${srcdir}/${pkgname%-bin}.sh" > "${srcdir}/${pkgname%-bin}.sh.tmp"
    mv "${srcdir}/${pkgname%-bin}.sh.tmp" "${srcdir}/${pkgname%-bin}.sh"
    # Create high-DPI launcher
    sed "s|/bin/${pkgname%-bin}\"$|/bin/${pkgname%-bin}-high-dpi\"|" \
        "${srcdir}/${pkgname%-bin}.sh" > "${srcdir}/${pkgname%-bin}-high-dpi.sh"
    bsdtar -xf "${srcdir}/data."*
    find "${srcdir}" -type d -exec chmod 755 {} \;
    find "${srcdir}" -type f -name "*.*" -perm 777 -exec chmod 644 {} \;
    find "${srcdir}" -type f -perm 777 -exec chmod 755 {} \;
    # Fix desktop files
    sed -i -e "
        s|Exec=\"/opt/${pkgname%-bin}/bin/${_pkgname}\"|Exec=/usr/lib/${pkgname%-bin}/bin/${pkgname%-bin}|
        s|Icon=/opt/${pkgname%-bin}/lib/${_pkgname// /_}.png|Icon=${pkgname%-bin}|
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname// /_}.desktop"
    sed -i -e "
        s|Exec=\"/opt/${pkgname%-bin}/bin/${_pkgname} High-DPI\"|Exec=/usr/lib/${pkgname%-bin}/bin/${pkgname%-bin}-high-dpi|
        s|Icon=/opt/${pkgname%-bin}/lib/${_pkgname// /_}_High-DPI.png|Icon=${pkgname%-bin}-high-dpi|
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname// /_}_High-DPI.desktop"
    # Create symlinks for system-provided tools
    ln -sf "/usr/bin/7za" "${srcdir}/opt/${pkgname%-bin}/lib/app/Library/7za"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${pkgname%-bin}/lib/app/Library/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${srcdir}/opt/${pkgname%-bin}/lib/app/Library/ffprobe"
    ln -sf "/usr/bin/yt-dlp" "${srcdir}/opt/${pkgname%-bin}/lib/app/Library/yt-dlp_linux"
    ln -sf "/usr/bin/mediainfo" "${srcdir}/opt/${pkgname%-bin}/lib/app/Library/mediainfo"
    ln -sf "/usr/bin/dcraw" "${srcdir}/opt/${pkgname%-bin}/lib/app/Library/dcraw"
    ln -sf "/usr/bin/dvdauthor" "${srcdir}/opt/${pkgname%-bin}/lib/app/Library/dvdauthor"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/${pkgname%-bin}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    # Rename binaries to match pkgname convention
    mv "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${_pkgname}" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${pkgname%-bin}"
    mv "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${_pkgname} High-DPI" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${pkgname%-bin}-high-dpi"
    # Rename configs to match renamed binaries
    mv "${pkgdir}/usr/lib/${pkgname%-bin}/lib/app/${_pkgname}.cfg" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/lib/app/${pkgname%-bin}.cfg"
    mv "${pkgdir}/usr/lib/${pkgname%-bin}/lib/app/${_pkgname} High-DPI.cfg" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/lib/app/${pkgname%-bin}-high-dpi.cfg"
    # Install launcher scripts
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}-high-dpi.sh" "${pkgdir}/usr/bin/${pkgname%-bin}-high-dpi"
    # Install desktop files
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname// /_}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname// /_}_High-DPI.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}-high-dpi.desktop"
    # Install icons
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname// /_}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname// /_}_High-DPI.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}-high-dpi.png"
}
