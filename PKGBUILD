# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=anytxt-bin
_pkgname=Anytxt
_debname="com.cbewin.${pkgname%-bin}"
pkgver=1.3.3235
pkgrel=1
pkgdesc="Desktop search tool for file content.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://anytxt.net.cn/"
_sfurl="https://sourceforge.net/projects/anytxt"
license=('LicenseRef-freeware')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'libxcrypt-compat'
    'pcre'
    'qt5-declarative'
    'qt5-base'
    'qt5-wayland'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_sfurl}/files/${_pkgname}_${pkgver}_Linux_Arm_64.deb/download")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_sfurl}/files/${_pkgname}_${pkgver}_Linux_X86_64.deb/download")
sha256sums=('db1db4c15024a45337e7e7190046e6414184603321be058797422a54ed5fc85d')
sha256sums_aarch64=('c566f28c1bdff9d882ca1eb27ded085bcfeb5aeab07c2fd99175ae902c8da598')
sha256sums_x86_64=('5b352290c951bc59eefe4d5cfe5d2fae12efa33a1aff82e9d5e2db974005477d')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/ATGUI/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/apps\/${_debname}\/files\/ATGUI/${pkgname%-bin}/g
        s/\/usr\/share\/icons\/hicolor\/256x256\/apps\/${_debname}.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
    rm -rf "${srcdir}/opt/apps/${_debname}/usr"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/apps/${_debname}/files/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/usr/lib/${pkgname%-bin}/ATGUI" "${pkgdir}/usr/bin/atgui"
}
