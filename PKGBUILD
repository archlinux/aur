# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_pkgname="fluent-reader"
pkgname="$_pkgname-bin"
pkgver=1.2.2
pkgrel=1

pkgdesc="Modern desktop RSS reader built with Electron, React, and Fluent UI."
arch=('x86_64')
# url="https://github.com/yang991178/fluent-reader"
url="https://hyliu.me/fluent-reader/"
license=('custom:BSD3')

depends=("alsa-lib"
	"at-spi2-core"
	"cairo"
	"dbus"
	"expat"
	"gcc-libs"
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
	"mesa"
	"nspr"
	"nss"
	"pango")
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
options=(strip emptydirs zipman)
changelog="changelog.md"

source=("${pkgname}-${pkgver}.${CARCH}.AppImage::https://github.com/yang991178/fluent-reader/releases/download/v${pkgver}/Fluent.Reader.${pkgver}.AppImage"
	"https://raw.githubusercontent.com/yang991178/fluent-reader/master/LICENSE")
noextract=("${pkgname}-${pkgver}.${CARCH}.AppImage")
b2sums=('5b9b91d6f7d0257630c74626b77cee3d594aa639995803557d388cdc3dfea5c72f624cf7aa6305662a8c71e5a91920b5600982295a8a56e3dda1f60675d9da5f'
	'0a8e04b682d991c30efd88ff67147b221eaf09e12c7234a776a90897bbedeb8379f73c5d853121f1b37d54bb510ea1bf223b8ef0f480ad3156c4159cbd78f0ac')

prepare() {
	# making .AppImage file executable
	chmod +x "${pkgname}-${pkgver}.${CARCH}.AppImage"

	# extract .AppImage file
	"./${pkgname}-${pkgver}.${CARCH}.AppImage" --appimage-extract >/dev/null
}

build() {
	# modifying .desktop file
	sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
}

package() {
	# Copy app files
	install -dm 755 "${pkgdir}/opt/${pkgname}"
	cp -a squashfs-root/* "${pkgdir}/opt/${pkgname}"

	# Fix permissions
	for d in locales resources; do
		chmod 755 "${pkgdir}/opt/${pkgname}/$d"
		find "${pkgdir}/opt/${pkgname}/$d" -type d -exec chmod 755 {} +
	done
	chown root:root "${pkgdir}/opt/${pkgname}/chrome-sandbox"
	chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"

	# Link entry point
	install -dm 755 "${pkgdir}/usr/bin"
	ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Copy icons files
	install -dm 755 "${pkgdir}/usr/share/icons"
	find squashfs-root/usr/share/icons -type d -exec chmod 755 {} +
	cp -a squashfs-root/usr/share/icons/* "${pkgdir}/usr/share/icons"

	# Copy desktop file
	install -Dm 644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Install LICENSE file
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Remove unused files
	rm -rf "${pkgdir}/opt/${pkgname}"/{usr,swiftshader,AppRun,${_pkgname}.{desktop,png}}
	# rm -rf "${pkgdir}/opt/${pkgname}"/{libGLESv2.so,libEGL.so,libvk_swiftshader.so,libvulkan.so.1}
	rm -rf "${pkgdir}/opt/${pkgname}"/LICENSE*
}
