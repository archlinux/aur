# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=oxideterm-bin
_pkgname=OxideTerm
pkgver=2.0.24
pkgrel=1
pkgdesc="All-in-one terminal workspace — local shells, SSH, SFTP, remote IDE, AI agent, and file manager in a single native binary. Built with Tauri 2 and pure Rust SSH (no OpenSSL). Smart reconnect, MCP, RAG, plugins, 30+ themes, 11 languages.(Prebuilt version)"
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
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x64.rpm")
sha256sums_aarch64=('10cf095f15e0bd08e22c0055b966ce07ea5eb4701a1a280b662896d1dc41c20c')
sha256sums_x86_64=('40b35f3e5221abdfab877a52050407dc721dd68df0d4e6df019dd391484b884f')
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
