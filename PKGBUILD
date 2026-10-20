# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_pkgname="betterdiscord-installer"
pkgname="$_pkgname-bin"
pkgver=2.0.0
pkgrel=1

pkgdesc="A simple standalone program which automates the installation, removal and maintenance of BetterDiscord."
arch=('x86_64')
# url="https://github.com/BetterDiscord/Installer"
url="https://betterdiscord.app/"
license=('MIT')

depends=("alsa-lib"
	"at-spi2-core"
	"sh"
	"webkit2gtk-4.1"
	"cairo"
	"dbus"
	"expat"
	"gcc-libs"
	"gdk-pixbuf2"
	"glib2"
	"glibc"
	"gtk3"
	"hicolor-icon-theme"
	"libcups"
	"libdrm"
	"libx11"
	"libxcb"
	"libxcomposite"
	"libxdamage"
	"libxext"
	"libxfixes"
	"libxkbcommon"
	"libxrandr"
	"libxshmfence"
	"mesa"
	"nspr"
	"nss"
	"pango")
provides=("betterdiscord" "$_pkgname")
conflicts=("betterdiscord" "$_pkgname")
replaces=("betterdiscord" "$_pkgname")
options=(strip emptydirs zipman)
makedepends=('unzip')

source=("${pkgname}-${pkgver}.${CARCH}.AppImage.zip::https://github.com/BetterDiscord/Installer/releases/download/v${pkgver}/BetterDiscord-Installer-Linux.AppImage.zip"
	"LICENSE::https://raw.githubusercontent.com/BetterDiscord/Installer/main/LICENSE"
	"file://usr--SLASH--bin--SLASH--betterdiscord-installer")
noextract=("${pkgname}-${pkgver}.${CARCH}.AppImage.zip")
b2sums=('b128536ff66c1cd3f45012b6a5a72eb21a8301b3d464d2cd4e20cb6b608cef2f8c5da135ffe332018406492500b2ae92bacf3dff557c7ad483c213bdc3b3e0e4'
        '9efca07a8806137067825ffa7e285950d4bbd1ed3c5a252af83d9408d51fc6530f9be7e1a467e28e73374b9057f52646fff419545a9d2fa466412ee2043ac56d'
        'b31d61be03a20c315a0fbcf2b2a75da5fe442d7de7951a9c75c31e34ed0c91c9f15b585bc82fa9634e913c774b3f932cf3d476b981eacfb8707f6db7503494c7')

prepare() {
	# extract the AppImage from the release archive
	unzip -o "${pkgname}-${pkgver}.${CARCH}.AppImage.zip"
	mv BetterDiscord-Installer-Linux.AppImage "${pkgname}-${pkgver}.${CARCH}.AppImage"

	# making .AppImage file executable
	chmod +x "${pkgname}-${pkgver}.${CARCH}.AppImage"

	# extract .AppImage file
	"./${pkgname}-${pkgver}.${CARCH}.AppImage" --appimage-extract >/dev/null
}

build() {
	# Point the desktop entry at the installed launcher.
	sed -i -E "s|^Exec=.*|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
}

package() {
	# Install the standalone app binary where the launcher expects it.
	install -dm 755 "${pkgdir}/opt/${pkgname}"
	install -Dm 755 squashfs-root/usr/bin/BetterDiscord-Installer "${pkgdir}/opt/${pkgname}/${_pkgname}"

	# Link entry point
	install -dm 755 "${pkgdir}/usr/bin"
	cp "usr--SLASH--bin--SLASH--betterdiscord-installer" "${pkgdir}/usr/bin/${_pkgname}"

	# Install the application icon.
	install -Dm 644 squashfs-root/${_pkgname}.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

	# Copy desktop file
	install -Dm 644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Install LICENSE file
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
