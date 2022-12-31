# Maintainer: neeshie0 <anemovva@gmail.com>

pkgname=sol-client
_pkgname=sol-client
pkgver=1.8.9
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
sha256sums=('57d18daa8e717625bcbeb07f3b9e1f2146d4e6199debe03d7b3d8b1bc6957b09')

prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
	cd squashfs-root
	mv "Sol Client" sol-client
	rm "Sol Client.desktop"
	curl -Os https://raw.githubusercontent.com/Sol-Client/Client/main/assets/sol-client.desktop
	rm "Sol Client.png"
	curl -Os https://raw.githubusercontent.com/Sol-Client/Client/main/assets/icon.png
    mv icon.png $pkgname.png

	convert $pkgname.png -resize 16x16 "usr/share/icons/hicolor/16x16/apps/sol-client.png"
	convert $pkgname.png -resize 32x32 "usr/share/icons/hicolor/32x32/apps/sol-client.png"
	convert $pkgname.png -resize 48x48 "usr/share/icons/hicolor/48x48/apps/sol-client.png"
	convert $pkgname.png -resize 64x64 "usr/share/icons/hicolor/64x64/apps/sol-client.png"
	convert $pkgname.png -resize 128x128 "usr/share/icons/hicolor/128x128/apps/sol-client.png"
	convert $pkgname.png -resize 256x256 "usr/share/icons/hicolor/256x256/apps/sol-client.png"
	cd ..

	rm "squashfs-root/usr/share/icons/hicolor/16x16/apps/Sol Client.png"
	rm "squashfs-root/usr/share/icons/hicolor/32x32/apps/Sol Client.png"
	rm "squashfs-root/usr/share/icons/hicolor/48x48/apps/Sol Client.png"
	rm "squashfs-root/usr/share/icons/hicolor/64x64/apps/Sol Client.png"
	rm "squashfs-root/usr/share/icons/hicolor/128x128/apps/Sol Client.png"
	rm "squashfs-root/usr/share/icons/hicolor/256x256/apps/Sol Client.png"
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

	echo ${pkgdir}

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
