# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

pkgname="mymonero"
pkgver=1.3.3
pkgrel=2

pkgdesc="The simplest way to use the next-generation private digital currency Monero, at the sweet spot between security, convenience, and features."
arch=('x86_64')
# url="https://github.com/mymonero/mymonero-app-js"
url="https://www.mymonero.com/"
license=('BSD-3')

depends=("alsa-lib"
	"at-spi2-core"
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
	"libxcursor"
	"libxdamage"
	"libxext"
	"libxfixes"
	"libxi"
	"libxrandr"
	"libxrender"
	"libxss"
	"libxtst"
	"mesa"
	"nspr"
	"nss"
	"pango")
provides=("$pkgname")
options=(strip emptydirs zipman)
changelog="changelog.md"

source=("${pkgname}-${pkgver}.${CARCH}.AppImage::https://github.com/mymonero/mymonero-app-js/releases/download/v${pkgver}/MyMonero-${pkgver}.AppImage"
	"LICENSE::https://raw.githubusercontent.com/mymonero/mymonero-app-js/master/LICENSE.txt")
noextract=("${pkgname}-${pkgver}.${CARCH}.AppImage")
b2sums=('a2fe1e6c58c4996d9d56c901d8269393410edb86e74707bdb6508829ca6fd03145920e64b61a75606adb2b68179894ed51b8c2df14b568f50643600be83ce601'
	'e15003acc9be63fd7b76a1021d86045f82fe19a63551c0f2ab1478d4e3e3be8a9bb7dc7f4f06b79fa1005995cebd73807259c3c5c36861f085ca7ad7959eef52')

prepare() {
	# making .AppImage file executable
	chmod +x "${pkgname}-${pkgver}.${CARCH}.AppImage"

	# extract .AppImage file
	"./${pkgname}-${pkgver}.${CARCH}.AppImage" --appimage-extract >/dev/null
}

build() {
	# modifying .desktop file
	sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${pkgname}|" "squashfs-root/${pkgname}.desktop"
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
	ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Copy icons files
	install -dm 755 "${pkgdir}/usr/share/icons"
	find squashfs-root/usr/share/icons -type d -exec chmod 755 {} +
	cp -a squashfs-root/usr/share/icons/* "${pkgdir}/usr/share/icons"

	# Copy desktop file
	install -Dm 644 "squashfs-root/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# Install LICENSE file
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Remove unused files
	rm -rf "${pkgdir}/opt/${pkgname}"/{usr,swiftshader,AppRun,${pkgname}.{desktop,png}}
	rm -rf "${pkgdir}/opt/${pkgname}"/{libGLESv2.so,libEGL.so,libvk_swiftshader.so,libvulkan.so}
	rm -rf "${pkgdir}/opt/${pkgname}"/{locales,LICENSE*}
}
