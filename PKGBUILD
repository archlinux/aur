# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lotti-bin
_pkgname=Lotti
_debname="com.matthiasn.${pkgname%-bin}"
_pkgver=1.1.67
_subver=4455
pkgver="${_pkgver}+${_subver}"
pkgrel=1
pkgdesc="A private logbook with a staff of personal AI assistants. Agents read what you record and propose what to do next — you approve the changes. End-to-end encrypted sync between your own devices — servers only ever see ciphertext. Local AI optional."
arch=('x86_64')
url="https://matthiasn.github.io/lotti/"
_ghurl="https://github.com/matthiasn/lotti"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'pango'
    'gdk-pixbuf2'
    'mpv'
    'gtk3'
    'libkeybinder3'
    'libsecret'
    'libepoxy'
    'cairo'
    'at-spi2-core'
    'harfbuzz'
    'libxmu'
    'gstreamer'
    'gst-plugins-base-libs'
    'ffmpeg'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${_pkgver}-x86_64.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('adc78ed74da5e8cce31a5f9fa49cc25d374f0c882799fd467fb9ac93a311f409'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/parecord/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/Icon=${_debname}/Icon=${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/applications/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_debname}.metainfo.xml"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/squashfs-root/usr/bin/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/usr/"{bin,lib} "${pkgdir}/usr"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}
