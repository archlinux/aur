# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=syng-bin
_pkgname=Syng
pkgver=2.5.1
_zhsname='词应'
pkgrel=1
pkgdesc="A free, open source, cross-platform, Chinese-To-English dictionary for desktops."
arch=(
    'aarch64'
    'x86_64'
)
url="https://getsyng.com/"
_ghurl="https://github.com/sotch-pr35mac/syng"
license=(
    'GPL-3.0-only'
    'LicenseRef-CC-CEDICT'
    'LicenseRef-App-Store-Exception'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('f5d706cb5bc46b24faa9476060dbf9de3f1f4c4bc8052ffda467aa769ac43724')
sha256sums_x86_64=('b58347bf329c6c8ab66b5b4a2cb7334cebfd8e34940210bbe69c3f65c82ad98a')
prepare() {
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/
        3i\Name[zh_CN]=${_zhsname}
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/licenses/CC-CEDICT-CC-BY-SA.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/licenses/Syng-App-Store-Exception.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}