# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lotti-bin
_pkgname=Lotti
_debname="com.matthiasn.${pkgname%-bin}"
pkgver=1.1.98+4488
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
    #"${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${_pkgver}-x86_64.AppImage"
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/${pkgver}/linux.x64.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('c334fbc9afbeffa2c2a72de125bd1de22a09aded4de357fc92c673ace90098ef'
            'd7002fa1a9ae60749490e982fa8a4f4622f7381b02559f5b014df033c0773a3c')
_install_icons() {
	local _src="${1:-${srcdir}}" _name="${pkgname%-bin}" _icon _ext _size _dest
	while IFS= read -r -d '' _icon; do
		_ext="${_icon##*.}"
		_size=$(echo "${_icon%/*}" | grep -oE '[0-9]+x[0-9]+|scalable' | head -1)
		[[ -z "${_size}" ]] && _size=$([[ "${_ext}" == svg ]] && echo scalable || od -An -tu1 -j16 -N8 "${_icon}" 2>/dev/null | awk '{printf "%dx%d",$1*16777216+$2*65536+$3*256+$4,$5*16777216+$6*65536+$7*256+$8}')
		[[ "${_size}" =~ ^[0-9]+x[0-9]+$ ]] || _size=scalable
		_dest=$([[ "${_icon}" == */share/pixmaps/* ]] && echo pixmaps || echo "icons/hicolor/${_size}/apps")
		install -Dm644 "${_icon}" "${pkgdir}/usr/share/${_dest}/${_name}.${_ext}"
	done < <(find "${_src}" \( -path '*/share/icons/*' -o -path '*/share/pixmaps/*' -o -path '*entries/icons/*' \) -type f \( -name '*.png' -o -name '*.svg' \) -print0 2>/dev/null)
}
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/parecord/g
    " "${srcdir}/${pkgname%-bin}.sh"
    #if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
    #    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    #fi
    #if [ -d "${srcdir}/squashfs-root" ];then
    #    rm -rf "${srcdir}/squashfs-root"
    #fi
    #"${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    #sed -i "s/Icon=${_debname}/Icon=${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/applications/${_debname}.desktop"
    #sed -i "s/${_debname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_debname}.metainfo.xml"
    #ln -sf "/usr/bin/ffmpeg" "${srcdir}/squashfs-root/usr/bin/${pkgname%-bin}"
    sed -i "s/Icon=${_debname}/Icon=${pkgname%-bin}/g" "${srcdir}/share/applications/${_debname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    #cp -a "${srcdir}/squashfs-root/usr/"{bin,lib} "${pkgdir}/usr"
    #install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/"{data,lib,"${pkgname%-bin}"} "${pkgdir}/usr/lib/${pkgname%-bin}"
    _install_icons
    #install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}
