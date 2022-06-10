# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_pkgname="fluent-reader"
pkgname="$_pkgname-bin"
pkgver=1.1.1
pkgrel=1

pkgdesc="Modern desktop RSS reader built with Electron, React, and Fluent UI."
arch=('x86_64')
# url="https://github.com/yang991178/fluent-reader"
url="https://hyliu.me/fluent-reader/"
license=('custom:BSD3')

depends=("gtk3" "nss")
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
# options=(debug !strip emptydirs zipman)
options=(strip emptydirs zipman)
# install="$pkgname.install"
changelog="changelog.md"

source=("${pkgname}-${pkgver}.${CARCH}.AppImage::https://github.com/yang991178/fluent-reader/releases/download/v${pkgver}/Fluent.Reader.${pkgver}.AppImage"
	"LICENSE::https://raw.githubusercontent.com/yang991178/fluent-reader/master/LICENSE")
noextract=("${pkgname}-${pkgver}.${CARCH}.AppImage")
b2sums=('9579e64c74bdecc930acc4662562930875e6fb9b92580b90582feb84531f15162fdd81f18093374a83ebdabfa25e6bfff513f381388f2516a2c6fdcf0f0e8760'
	'0a8e04b682d991c30efd88ff67147b221eaf09e12c7234a776a90897bbedeb8379f73c5d853121f1b37d54bb510ea1bf223b8ef0f480ad3156c4159cbd78f0ac')

prepare() {
	# making .AppImage file executable
	chmod -v +x "${pkgname}-${pkgver}.${CARCH}.AppImage"

	# extract .AppImage file
	"./${pkgname}-${pkgver}.${CARCH}.AppImage" --appimage-extract
}

build() {
	# modifying .desktop file
	sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
}

package() {
	# Copy app files
	install -vdm 755 "${pkgdir}/opt/${pkgname}"
	cp -va squashfs-root/* "${pkgdir}/opt/${pkgname}"

	# Fix permissions
	for d in locales resources; do
		chmod -v 755 "${pkgdir}/opt/${pkgname}/$d"
		find "${pkgdir}/opt/${pkgname}/$d" -type d -exec chmod -v 755 {} +
	done
        chown root:root "${pkgdir}/opt/${pkgname}/chrome-sandbox"
        chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"

	# Link entry point
	install -vdm 755 "${pkgdir}/usr/bin"
	ln -vsf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Copy icons files
	install -vdm 755 "${pkgdir}/usr/share/icons"
	find squashfs-root/usr/share/icons -type d -exec chmod -v 755 {} +
	cp -va squashfs-root/usr/share/icons/* "${pkgdir}/usr/share/icons"

	# Copy desktop file
	install -vDm 644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Install LICENSE file
	install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Remove unused files
	rm -vrf "${pkgdir}/opt/${pkgname}"/{usr,swiftshader,AppRun,${_pkgname}.{desktop,png}}
	# rm -vrf "${pkgdir}/opt/${pkgname}"/{libGLESv2.so,libEGL.so,libvk_swiftshader.so,libvulkan.so.1}
	rm -vrf "${pkgdir}/opt/${pkgname}"/LICENSE*
}
