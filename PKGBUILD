# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=note-gen-bin
_pkgname=NoteGen
pkgver=0.37.0
pkgrel=1
pkgdesc="A local-first Markdown app that helps you collect scattered information and organize it into clear notes with AI.一款本地优先、以 Markdown 为核心，帮助你收集碎片信息，并借助 AI 将它们整理成清晰笔记的跨平台应用。"
arch=('x86_64')
url="https://notegen.top/"
_ghurl="https://github.com/codexu/note-gen"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgname%-bin}-v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('0f29037ab505ef0e49d6a703d74203d290565b26279cd02c6629f71ab2741298')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/usr/lib/${_pkgname}" "${pkgdir}/usr/lib"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
