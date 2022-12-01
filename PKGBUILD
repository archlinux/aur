# Maintainer: neeshie0 <anemovva@gmail.com>

pkgname=sol-client
_pkgname=solclient
pkgver=1.8.8
pkgrel=1
pkgdesc='Simple yet feature-rich open-source Minecraft client'
url=https://github.com/Sol-Client/Client
arch=(x86_64)
license=('GPL3')
depends=('jre8-openjdk')
makedepends=('curl')
options=(!strip)
_appimage="Sol.Client-${pkgver}.AppImage"
source=("https://github.com/Sol-Client/Client/releases/download/$pkgver/$_appimage")
sha256sums=('b375a1efe5fdefdd4e940f0b238c83e4d39d1705b1b9e4f5fa3473b7b51b13db')

prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
	cd squashfs-root
	mv "Sol Client" solclient
	mv "Sol Client.desktop" solclient.desktop
	mv "Sol Client.png" solclient.png
	cd ..
	mv "squashfs-root/usr/share/icons/hicolor/16x16/apps/Sol Client.png" "squashfs-root/usr/share/icons/hicolor/16x16/apps/solclient.png"
	mv "squashfs-root/usr/share/icons/hicolor/32x32/apps/Sol Client.png" "squashfs-root/usr/share/icons/hicolor/32x32/apps/solclient.png"
	mv "squashfs-root/usr/share/icons/hicolor/48x48/apps/Sol Client.png" "squashfs-root/usr/share/icons/hicolor/48x48/apps/solclient.png"
	mv "squashfs-root/usr/share/icons/hicolor/64x64/apps/Sol Client.png" "squashfs-root/usr/share/icons/hicolor/64x64/apps/solclient.png"
	mv "squashfs-root/usr/share/icons/hicolor/128x128/apps/Sol Client.png" "squashfs-root/usr/share/icons/hicolor/128x128/apps/solclient.png"
	mv "squashfs-root/usr/share/icons/hicolor/256x256/apps/Sol Client.png" "squashfs-root/usr/share/icons/hicolor/256x256/apps/solclient.png"
	}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E \
		"s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
		"squashfs-root/${_pkgname}.desktop"
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 \
		"${srcdir}/${_appimage}" \
		"${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

	# Desktop file
	install -Dm644 \
		"${srcdir}/squashfs-root/${_pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a \
		"${srcdir}/squashfs-root/usr/share/icons" \
		"${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/${_pkgname}/${_pkgname}.AppImage" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
# vim:set ts=4 sw=4 noet:
