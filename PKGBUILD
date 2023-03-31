# Maintainer: Gustavo Chain <me@qustavo.cc>

_pkgname=notesnook
pkgname="${_pkgname}-bin"
pkgver=2.4.6
pkgrel=1
pkgdesc="Open source zero knowledge private note taking"
arch=('x86_64')
url="https://notesnook.com"
_githuburl="https://github.com/streetwriters/notesnook"
license=('GPL')
options=(!strip)
depends=('gtk2' 'nspr' 'hicolor-icon-theme' 'libxext' 'gtk3' 'libcups' 'libxdamage' 'libxfixes' 'libdrm' 'expat' 'dbus' 'at-spi2-core' \
	'mesa' 'libdbusmenu-glib' 'gdk-pixbuf2' 'glib2' 'glibc' 'pango' 'wayland' 'alsa-lib' 'libx11' 'nss' 'libxrandr' 'cairo' 'gcc-libs' \
	'sh' 'libxkbcommon' 'libxcomposite' 'libxcb' 'dbus-glib')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-appimage")
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.AppImage")
sha256sums=('efdaed9ad186dc64a6bdb5e5b9568fd77013559ff0ecd6654cfd0e528f03e1c5')
prepare() {
	chmod +x "${_pkgname}-${pkgver}.AppImage"
	"./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	cp -r "${pkgdir}//opt/${pkgname}/usr" "${pkgdir}"
	sed 's/AppRun/notesnook/g' -i "${pkgdir}/opt/${pkgname}/${_pkgname}.desktop"
	install -Dm644 "${pkgdir}/opt/${pkgname}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	find "${pkgdir}" -type d -exec chmod 755 {} \;
}