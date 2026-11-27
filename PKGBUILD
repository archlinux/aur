# Maintainer: develOseven <devel.oseven@gmail.com>
pkgname=tagwarp-appimage
pkgver=1.3.0
pkgrel=1
pkgdesc="File Tagging Manager"
arch=('x86_64')
url="https://tagwarp.com"
license=(
	'LicenseRef-TagWarp-Proprietary'
)
options=(!strip !debug)
source=(
	${url}/downloads/TagWarp-${pkgver}-alpha-x86_64.AppImage
	LicenseRef-TagWarp-Proprietary.txt
)
_filename="TagWarp-${pkgver}-alpha-x86_64.AppImage"
_squashfs_desktop_file="tagwarp.desktop"
_squashfs_icon_file="tagwarp.svg"
_desktop_file="/usr/share/applications/tagwarp.desktop"
_appimage_name="TagWarp.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

package() {
	chmod +x "${_filename}"

	install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
	mkdir -p "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
	ln -s "${_install_path}" "${pkgdir}/usr/bin/tagwarp"

    ./${_filename} --appimage-extract "${_squashfs_desktop_file}" >/dev/null 2>&1
    sed -i -E "s|Exec=tagwarp|Exec=${_install_path}|" "squashfs-root/${_squashfs_desktop_file}"
	install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"

    ./${_filename} --appimage-extract "${_squashfs_icon_file}" >/dev/null 2>&1
	install -Dm644 "squashfs-root/${_squashfs_icon_file}" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

	install -Dm644 LicenseRef-TagWarp-Proprietary.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
sha256sums=('7da9ff2a4c6b73ce78dfdd5321d909844c320f568bd9a6066a0b7048aecdc86f'
            '6647c68fb5ec860cb27a3599441d9a96e67dd2230b79800d65701435afaca32c')
