# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: zhullyb <zhullyb at outlook dot com>
# Contributor: Nico <d3sox at protonmail dot com>

_pkgname=fluent-reader
pkgname=$_pkgname-electron-bin
pkgver=1.1.3
pkgrel=1
pkgdesc='Modern desktop RSS reader built with Electron, React, and Fluent UI. (with system electron)'
arch=('any')
url='https://hyliu.me/fluent-reader'
_url='https://github.com/yang991178/fluent-reader'
license=('custom:BSD3')
depends=('hicolor-icon-theme' 'gtk3' 'nss' 'electron')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(strip emptydirs zipman)
_appimage=${_pkgname}-${pkgver}.AppImage
source=("$_appimage::${_url}/releases/download/v${pkgver}/Fluent.Reader.${pkgver}.AppImage"
		"$_pkgname.sh")
sha256sums=('0b3be139a59f678aedd8798bff2bfa3fb23110f2e8cae0617ed3b172374c2275'
			'9887decd3a128b84f10ffdd1cda7a201d4e156f56928d2a8f31685d713829b92')

prepare() {
	# making .AppImage file executable
	chmod -v +x "$_appimage"

	# extract .AppImage file
	"./$_appimage" --appimage-extract
}

build() {
	# modifying .desktop file
	sed -i -E "s|^Exec=AppRun --no-sandbox|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
	# modifying .sh file
	sed -i -E "s|ASAR|/usr/lib/$_pkgname/app.asar|" "$srcdir/$_pkgname.sh"
}

package() {
	# Copy app files
	install -dm 755 "${pkgdir}/usr/lib/${_pkgname}"
	cp -v squashfs-root/resources/* "${pkgdir}/usr/lib/${_pkgname}"

	# Link entry point
	install -vdm 755 "${pkgdir}/usr/bin"
	install "$_pkgname.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# Copy icons files
	install -vdm 755 "${pkgdir}/usr/share/icons"
	find squashfs-root/usr/share/icons -type d -exec chmod -v 755 {} +
	cp -va squashfs-root/usr/share/icons/* "${pkgdir}/usr/share/icons"

	# Copy desktop file
	install -vDm 644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
 
