# Maintainer: Martin Rys <rys.pw/#contact_me>
_pkgname=poe-overlay-community
pkgname=${_pkgname}-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="An overlay for Path of Exile. Built with Electron and Angular."
arch=('x86_64')
url="https://github.com/PoE-Overlay-Community/PoE-Overlay-Community-Fork"
license=('MIT')
provides=(${_pkgname})
conflicts=()
replaces=()
depends=()
makedepends=()
backup=()

options=()
source=("poe-overlay-${pkgver}.AppImage::https://github.com/PoE-Overlay-Community/PoE-Overlay-Community-Fork/releases/download/v${pkgver}/poe-overlay-${pkgver}.AppImage")
sha256sums=('a2244538a64279fa56e811af58024e96475799b08364c797a2266b5f9af30d02')

prepare() {
	chmod u+x      ${srcdir}/poe-overlay-${pkgver}.AppImage
	${srcdir}/poe-overlay-${pkgver}.AppImage --appimage-extract
}

package() {
	ls ${srcdir}
	find           ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
	find           ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +
	# https://github.com/PoE-Overlay-Community/PoE-Overlay-Community-Fork/issues/94
	mv             ${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0 ${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256
	rm ${srcdir}/squashfs-root/poe-overlay.png
	install -d     ${pkgdir}/opt/${_pkgname}
	cp -r          ${srcdir}/squashfs-root/*                                     ${pkgdir}/opt/${_pkgname}
	rm             ${pkgdir}/opt/${_pkgname}/AppRun
	find           ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +
	install -d     ${pkgdir}/usr/share/icons
	cp -r          ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor
	install -d     ${pkgdir}/usr/bin
	ln -s          /opt/${_pkgname}/poe-overlay                             ${pkgdir}/usr/bin/poe-overlay
	sed -i         s/AppRun/poe-overlay/ ${srcdir}/squashfs-root/poe-overlay.desktop
	install -Dm644 ${srcdir}/squashfs-root/poe-overlay.desktop                   ${pkgdir}/usr/share/applications/${_pkgname}.desktop
	rm             ${srcdir}/squashfs-root/poe-overlay.desktop
}
