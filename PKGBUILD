# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_pkgname="fluent-reader"
pkgname="$_pkgname-bin"
pkgver=1.0.2
pkgrel=2

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
b2sums=('5d1fda961ec2aceb39165dc449776a8f857297f4a404beb42b33d9a63c5f956fa1441839d77ed20e606b1d80b3db1de4b4f0eb6fbbc647dc35aaa944d7e74b7e'
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
	rm -vrf "${pkgdir}/opt/${pkgname}"/{libGLESv2.so,libEGL.so,libvk_swiftshader.so,libvulkan.so.1}
	rm -vrf "${pkgdir}/opt/${pkgname}"/{locales,LICENSE*}
}
