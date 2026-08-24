# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jmcomic-downloader-bin
_pkgname='禁漫天堂下载器'
pkgver=0.18.0
pkgrel=1
pkgdesc="禁漫天堂 18comic.vip jmcomic 18comic 的多线程下载器,带图形界面,带收藏夹,免费下载收费的漫画,下载速度飞快.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/lanyeeee/jmcomic-downloader"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lanyeeee/jmcomic-downloader/v${pkgver}/LICENSE"
)
sha256sums=('cf758460eb1e781565abaf0d9e6240848c3e03df93212c0a4e9bcc5ef575a855'
            'ae7de703fea01a9062558dc66bceb86fe33e1449182e2be2b44fb71c6efa139d')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
