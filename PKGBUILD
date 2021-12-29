# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

pkgname="mymonero"
pkgver=1.2.4
pkgrel=1

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
b2sums=('a5d681918f8a5c0ea3efbe0aae0ab46e6fdea2b96186dfbed03056f8b70294af2c1f0412d48206e070056ee8dfece8f0a388af8b8658778408448c5bdcc4bd72'
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
