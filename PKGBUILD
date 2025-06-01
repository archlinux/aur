# Maintainer: munsternet <munsternet at ik dot me>

_pkgname=vatis
pkgname="${_pkgname}-appimage"
pkgver=4.1.0_beta.19
pkgrel=1
pkgdesc="The latest stable AppImage of vATIS - an ATIS Solution for VATSIM"
arch=('x86_64')
url="https://vatis.app"
license=('GPL-3.0-or-later')
provides=("${pkgname}")
depends=('zlib' 'fuse2')
options=(!strip)

_appimage="${pkgname}-${pkgver}.AppImage"
_desktop_prefix="org.vatsim.${_pkgname}"

source=("${_appimage}::https://hub.vatis.app/download/linux")
noextract=("${_appimage}")
b2sums=('9242aedb3e08490cb67c21cbffb5071f1febc5dd9f9863c2ee191a07eba8302ce6cd5f89e0a3da13e4ede339dfc8876b46999ee88c1161d6e2b938d7009b1677')

prepare() {
	chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
		"squashfs-root/${_desktop_prefix}.desktop"
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_desktop_prefix}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
    cp -a "${srcdir}/squashfs-root/${_desktop_prefix}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
