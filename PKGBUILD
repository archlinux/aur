# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jiwu-mall-chat-bin
_pkgname=JiwuChat
_zhsname='极物圈聊天'
pkgver=2.0.3
pkgrel=1
pkgdesc="A lightweight multi-platform chat application that can be used anytime, anywhere.(Prebuilt version)一个轻量的多端随时随地的聊天应用 ✨"
arch=('x86_64')
url="https://chat.jiwu.kiwi233.top"
_ghurl="https://github.com/KiWi233333/jiwu-mall-chat-tauri"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('aa3e2ec83830ea0bf5b27a361fd8224fead3f301769983d259c431b8e9e9d6d6')
prepare() {
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        6i\Name[zh_CN]=${_zhsname}
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -a "${srcdir}/usr/lib" "${pkgdir}/usr"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
