# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hyphenbox-bin
_pkgname=HyphenBox
_zhsname='黑粉盒子'
pkgver=1.0.3
pkgrel=1
pkgdesc="Free large model API radar + local unified routing. Includes 103 free APIs to measure which ones are still alive; your Key only exists on your own computer, and a local interface is connected to Cursor/Cline/OpenCode."
arch=('x86_64')
url="https://github.com/HackerChi-Hub/hyphenbox-release"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.md::${url}/blob/v${pkgver}/LICENSE_PENDING.md"
)
sha256sums=('05b24aeb0e0f5c9fc8b3c3e454a278429e3daa4a6882f6b2e5a6fd4032848940'
            '82b530250cbae59b5b835528bc3555561c546c2b8c2729772b9a5a4736d4b8d0')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "5i\Name[zh_CN]=${_zhsname}" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    local _icon_dir="${srcdir}/usr/share/icons/hicolor"
	[[ -d "${_icon_dir}/256x256@2" && ! -d "${_icon_dir}/512x512" ]] && mv "${_icon_dir}/256x256@2" "${_icon_dir}/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
