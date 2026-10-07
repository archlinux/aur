# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=oxideterm-bin
_pkgname=OxideTerm
pkgver=2.2.2
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
sha256sums_aarch64=('4d384582b4c45bdadb9bf787af7c5f8778ca2e8a1c73b45b1b5ed61bf818ddab')
sha256sums_x86_64=('82b085c9ba08d04af46673edd73108d0d2791f169b1c2a5658de72d57fff6cb1')
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
