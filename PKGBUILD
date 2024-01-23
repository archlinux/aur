# Maintainer: TimeTrap <zhaoyuanpan at gmail dot com>
# Contributor: Jingu <xiuluo dot android at gmail dot com>
# Contributor: Usama <eruzzamma at gmail dot com>
pkgname=cursor-appimage
_pkgname=cursor
pkgver=0.23.6
pkgrel=1
pkgdesc="Write, edit, and chat about your code with GPT. (AppImage)"
arch=('x86_64')
url="https://cursor.so"
license=('custom')
options=('!strip')
depends=('hicolor-icon-theme' 'zlib')

# Use curl to get the filename and extract the version
# pkgver=$(curl -s -o /dev/null -D - -r 0-0 https://download.cursor.sh/linux/appImage/x64 | grep -o -E 'filename=.*$' | sed -e 's/.*cursor-\(.*\)\(.*\)\.AppImage.*/\1\.\2/')

source=("${_pkgname}-${pkgver}.AppImage::https://download.cursor.sh/linux/appImage/x64")
sha256sums=('007dec0eff58e8bca5098b49427c190bf8c8e6094c46cac6002496c087a36bd8')
_install_path="/opt/appimages"

prepare() {
	chmod a+x "${_pkgname}-${pkgver}.AppImage"
	"./${_pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null

	# Modify the original desktop file
	sed 's/AppRun/\/opt\/appimages\/Cursor.AppImage/g' -i "${srcdir}/squashfs-root/cursor.desktop"
	sed 's/Exec=\/opt\/appimages\/Cursor.AppImage/Exec=\/opt\/appimages\/cursor.AppImage/g' -i "${srcdir}/squashfs-root/cursor.desktop"
	sed 's/StartupWMClass=Cursor/StartupWMClass=cursor/g' -i "${srcdir}/squashfs-root/cursor.desktop"

	# Create a copy of the desktop file for Wayland
	cp "${srcdir}/squashfs-root/cursor.desktop" "${srcdir}/squashfs-root/cursor-wayland.desktop"
	sed -i 's/^Name=Cursor/Name=Cursor (Wayland)/' "${srcdir}/squashfs-root/cursor-wayland.desktop"
	sed -i 's|Exec=/opt/appimages/cursor.AppImage|Exec=/opt/appimages/cursor.AppImage --ozone-platform=wayland|' "${srcdir}/squashfs-root/cursor-wayland.desktop"
}

package() {
	install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"

	# Install icons
	for _icons in 32x32 64x64 128x128 256x256 512x512; do
		install -Dm645 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/cursor.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/cursor.png"
	done

	# Install the desktop files
	install -Dm755 "${srcdir}/squashfs-root/cursor.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm755 "${srcdir}/squashfs-root/cursor-wayland.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-wayland.desktop"
}
