# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=wootility
pkgname=${_pkgname}-appimage
pkgver=3.6.16
pkgrel=2
pkgdesc='Utility for configuring Wooting keyboards (binary AppImage version)'
arch=('x86_64')
url='https://wooting.io/wootility'
license=('unknown')
depends=('fuse2')
makedepends=('p7zip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
_appimage="${_pkgname}-${pkgver}.AppImage"
install=$pkgname.install
source=("https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-linux-latest/${_appimage}"
        'wooting.rules')
noextract=("${_appimage}")
b2sums=('79a32462cb3f375344ace2a4785c950854b8a7dd027d9c1e7c24696135f641d1d88f56ccbc2dfadc53d278e291bf11735d81d860e57b83cb981366d4930bf641'
        '32611a6c0eafc122862b97693d402d8b6111ccccb1b920119c9bbd550833dccb14201cff8121487d2de1114f1a3de45163b22f4e6fb77b342562a3c441c72efc')

prepare() {
	7z x "${_appimage}" 'wootility.desktop' 'usr/share/icons' > /dev/null
}

build() {
	sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" wootility.desktop
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX usr
}

package() {
	install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
	install -d "${pkgdir}/usr/bin"
	ln -s "../../opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dpm644 'wootility.desktop' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -d "${pkgdir}/usr/share/icons"
	cp -a usr/share/icons/hicolor "${pkgdir}/usr/share/icons/hicolor"
	install -Dpm644 'wooting.rules' "${pkgdir}/usr/lib/udev/rules.d/wooting.rules"
}
