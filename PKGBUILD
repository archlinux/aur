# Maintainer: munsternet <munsternet at ik dot me>

_pkgname=vatis
pkgname="${_pkgname}-appimage"
pkgver=4.1.0_beta.14
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
b2sums=('ecde4a2108c8fa568313114482e48997de609a8e77b6ab6b2a5d1b5e95f0a9c76012118dc8c4109cc60974f69d1272d020a22ee34bb36782e118b291b18466ce')

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
