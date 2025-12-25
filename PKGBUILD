# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=sqlark-bin
_pkgname=SQLark
pkgver=3.8
_electronversion=32
pkgrel=2
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://download.sqlark.com/fullPackage/Linux/911014/${_pkgname}_V${pkgver}_linux_arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://download.sqlark.com/fullPackage/Linux/911014/${_pkgname}_V${pkgver}_linux_x86_64.rpm")
sha256sums_aarch64=('ae19612a672160a49e5869c6fc6c47cf2afb24cbc75605c6051f0bc1367921c2')
sha256sums_x86_64=('bc037a0733219c7762b7d89b3e605ccf157b31b2a25811e2b8944e88a16747f9')
prepare() {
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