# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=oxideterm-bin
_pkgname=OxideTerm
pkgver=2.2.1
pkgrel=1
pkgdesc="AI-native workspace for local shells and remote machines.Zero Webview, zero OpenSSL, zero telemetry, and no app subscription."
arch=(
    'aarch64'
    'x86_64'
)
url="https://oxideterm.app/"
_ghurl="https://github.com/AnalyseDeCircuit/oxideterm"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gstreamer'
    'alsa-lib'
    'libxkbcommon'
    'gst-plugins-base-libs'
    'dbus'
    'libxcb'
    'libxkbcommon-x11'
    'libappindicator'
    'libayatana-appindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x64.rpm")
sha256sums_aarch64=('20b6f52841c89c84d864f2ade13632b7a59cc0e898f0f37c8c603879a474cf62')
sha256sums_x86_64=('8cb1e3cd9c33bb3241b11535e9170c40cf455a08c8c1ae034f133bed80ceddb3')
prepare() {
    sed -i "s/\/opt\/${pkgname%-bin}\/${pkgname%-bin}-native/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/com.${pkgname%-bin}.app.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -a "${srcdir}/opt/${pkgname%-bin}/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}-native" "${pkgdir}/usr/bin/${pkgname%-bin}"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/com.${pkgname%-bin}.app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
