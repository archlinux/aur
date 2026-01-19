# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=sqlark-bin
_pkgname=SQLark
pkgver=3.8.1
_electronversion=32
pkgrel=1
pkgdesc="SQLark is a powerful SQL query tool that provides a user-friendly interface for database management and analysis."
arch=(
	'aarch64'
	'x86_64'
)
url="https://www.sqlark.com/"
license=('LicenseRef-scancode-commercial-license')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
	'python'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://download.sqlark.com/fullPackage/Linux/961002/${_pkgname}_V${pkgver}_linux_arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://download.sqlark.com/fullPackage/Linux/961002/${_pkgname}_V${pkgver}_linux_x86_64.rpm")
sha256sums_aarch64=('72782e5051bc5f737918a03152e5d1555db69a6c9f62a304467fb6ccf9229771')
sha256sums_x86_64=('ea34d196c0e06aa6f18504026fb7f60c57e76a894e32b6adb1c625d0971abb6b')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
	_get_electron_version
	sed -i "s/Exec=\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
	_file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
		libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
	for _files in "${_file_list[@]}";do
		ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/opt/${pkgname%-bin}/${_files}"
	done
}
package() {
	install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
	cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}"/* "${pkgdir}/usr/lib/${pkgname%-bin}"
	ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	_icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
