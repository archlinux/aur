# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

pkgname="mymonero"
pkgver=1.2.1
pkgrel=2

pkgdesc="The simplest way to use the next-generation private digital currency Monero, at the sweet spot between security, convenience, and features."
arch=('x86_64')
# url="https://github.com/mymonero/mymonero-app-js"
url="https://www.mymonero.com/"
license=('custom:MyMonero')

depends=("libxss" "nss" "gtk3")
provides=("$pkgname")
# options=(debug !strip emptydirs zipman)
options=(strip emptydirs zipman)
# install="$pkgname.install"
changelog="changelog.md"

source=("${pkgname}-${pkgver}.${CARCH}.AppImage::https://github.com/mymonero/mymonero-app-js/releases/download/v${pkgver}/MyMonero-${pkgver}.AppImage"
	"LICENSE::https://raw.githubusercontent.com/mymonero/mymonero-app-js/master/LICENSE.txt")
noextract=("${pkgname}-${pkgver}.${CARCH}.AppImage")
b2sums=('57881b1c024acda80ef8fe0a29f555e4cc20ae4cecdf08f6cb8daf5801c298b14333e35c3d276111c7d03327541fe92b4626aaf7b6ea9abe0642589a6cb19cb9'
	'e15003acc9be63fd7b76a1021d86045f82fe19a63551c0f2ab1478d4e3e3be8a9bb7dc7f4f06b79fa1005995cebd73807259c3c5c36861f085ca7ad7959eef52')

prepare() {
	# making .AppImage file executable
	chmod -v +x "${pkgname}-${pkgver}.${CARCH}.AppImage"

	# extract .AppImage file
	"./${pkgname}-${pkgver}.${CARCH}.AppImage" --appimage-extract
}

build() {
	# modifying .desktop file
	sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${pkgname}|" "squashfs-root/${pkgname}.desktop"
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
	rm -v "${pkgdir}/opt/${pkgname}/${pkgname}"
	mv -v "${pkgdir}/opt/${pkgname}/${pkgname}.bin" "${pkgdir}/opt/${pkgname}/${pkgname}"
	ln -vsf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Copy icons files
	install -vdm 755 "${pkgdir}/usr/share/icons"
	find squashfs-root/usr/share/icons -type d -exec chmod -v 755 {} +
	cp -va squashfs-root/usr/share/icons/* "${pkgdir}/usr/share/icons"

	# Copy desktop file
	install -vDm 644 "squashfs-root/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# Install LICENSE file
	install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Remove unused files
	rm -vrf "${pkgdir}/opt/${pkgname}"/{usr,swiftshader,AppRun,${pkgname}.{desktop,png}}
	rm -vrf "${pkgdir}/opt/${pkgname}"/{libGLESv2.so,libEGL.so,libvk_swiftshader.so,libvulkan.so}
	rm -vrf "${pkgdir}/opt/${pkgname}"/{locales,LICENSE*}
}
