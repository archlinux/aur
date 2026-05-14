# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=omniget-bin
_pkgname=OmniGet
pkgver=0.6.1
pkgrel=1
pkgdesc="Media downloader. Paste a link. Get your file. Udemy, Hotmart, Telegram and 1000+ Downloader.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://discord.gg/TA8A8r2z"
_ghurl="https://github.com/tonhowtf/omniget"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('0c7fac907721e8fc01c73fcbaa34acb15437bd2b4ec6a2cd9285c3aa5e37a4f0')
sha256sums_x86_64=('1d6e95537cdd9cb2a8d76ddf49115517da02d81fd30d8c3264ff1983a72a6593')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
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
}
