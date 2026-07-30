# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=steamdepotdownloadergui-bin
_pkgname=SteamDepotDownloaderGUI
pkgver=3.2.1
pkgrel=1
pkgdesc="🎮⌛Downgrade Steam games to older versions with ease using DepotDownloader.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/mmvanheusden/SteamDepotDownloaderGUI"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-linux-v${pkgver}-x64.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('6ccd72fee167c1ad366b7d9ec12e84c0611eebac900c0dfb27e9caa63bd40c6c'
            '23892713105b8ae95f92ccc36359cdab8115814bef0c88fc35a1c6b3cfe38124')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Categories=/Categories=Utility;/g
        s/Exec=vectum/Exec=${pkgname%-bin}/g
        s/StartupWMClass=vectum/StartupWMClass=${_pkgname}/g
        s/Icon=vectum/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/squashfs-root/usr/bin/vectum" "${pkgdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
}