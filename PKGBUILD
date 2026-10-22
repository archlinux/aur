# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Specter119 <spcter119 AT gmail.com>
# Contributor: Berturion@free.fr>
pkgname=switchhosts-bin
_pkgname=SwitchHosts
pkgver=5.0.3
pkgrel=1
pkgdesc='Switch hosts quickly!'
arch=(
    'aarch64'
    'x86_64'
)
url="https://switchhosts.app/"
_ghurl="https://github.com/oldj/SwitchHosts"
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.rpm")
sha256sums_aarch64=('32acac9dbb3490e3e69290eb0fcd59a3efbc33db937c98106458f0a55f9e803d')
sha256sums_x86_64=('6f303165f01d6e76812ce79418aa9f97314297096e0aed62b20b3caa3ccf0e44')
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    local _icon_dir="${pkgdir}/usr/share/icons/hicolor"
	[[ -d "${_icon_dir}/256x256@2" && ! -d "${_icon_dir}/512x512" ]] && mv "${_icon_dir}/256x256@2" "${_icon_dir}/512x512"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
