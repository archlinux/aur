# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=cline
pkgname="${_appname}-desktop-bin"
_pkgname=Cline
pkgver=0.0.46
pkgrel=1
pkgdesc="Cline AI coding agent."
arch=(
    'aarch64'
    'x86_64'
)
url="https://cline.bot/"
_ghurl="https://github.com/cline/cline"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libayatana-indicator'
    'libappindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/desktop-v${pkgver}/${_pkgname}_${pkgver}_aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/desktop-v${pkgver}/${_pkgname}_${pkgver}_x86_64.rpm")
sha256sums_aarch64=('2a81223e6ff4854a02146446d277fa60847c31e3ff2ed4fc9f48c5f2372ce956')
sha256sums_x86_64=('af41241eb11d720333256de651881a40b855eb72b829499a5fb2a7090c09780b')
prepare() {
    sed -i -e "
        s/Exec=${_appname}-app/Exec=${pkgname%-bin}/g
        s/Icon=${_appname}-app/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    [[ -d "${srcdir}/usr/share/icons/hicolor/256x256@2" ]] && mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x86_64 || echo aarch64)
    find "${srcdir}" -name "*${_archrem}*" -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}-app" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/code-sidecar" -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
