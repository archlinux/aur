# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hyphenbox-bin
_pkgname=HyphenBox
_zhsname='黑粉盒子'
pkgver=0.4.63
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
    "LICENSE-${pkgver}::${url}/blob/v${pkgver}/LICENSE_PENDING.md"
)
sha256sums=('4a4cf21cafaf68498c76b0b38aede96b0ddb93cdd387e7f6ef15d194782a53fa'
            '82b530250cbae59b5b835528bc3555561c546c2b8c2729772b9a5a4736d4b8d0')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "5i\Name[zh_CN]=${_zhsname}" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    cp -a "${srcdir}/usr/lib" "${pkgdir}/usr"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}