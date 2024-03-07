# Maintainer: 4s3ti <4s3ti@4s3ti.net>

_pkgver=1.4.0-rc.2
_appimage="Bazecor-${_pkgver}-x64.AppImage"

pkgname="bazecor"
pkgver=${_pkgver/-/.}
pkgrel=2
pkgdesc="Graphical configurator for Dygma keyboards"
url="https://github.com/Dygmalab/Bazecor"
license=("GPL-3.0-only")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
arch=("x86_64")
depends=('zlib' 'fuse2')
options=(!strip)
noextract=("${_appimage}")
source=("${url}/releases/download/v${_pkgver}/${_appimage}"
        "10-dygma.rules")
sha256sums=('0a859b8717d45b98b18c0b9f463d447f63550a4bdea01dcfd5f06363cadc46e3'
            '7cc39c4fdc1736c267d22d9fbaacc9db4afd026c3a77b1d263c3a11b65581def')

prepare() {
    chmod +x "${_appimage}"
    "./${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname/b/B}|"\
        "squashfs-root/${pkgname/b/B}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
    # Do not use Capital B for exec
    sed -i "s/Exec=Bazecor/Exec=bazecor/" "squashfs-root/${pkgname/b/B}.desktop"

}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${pkgname/b/B}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"

    # Udev Rules
    # https://github.com/Dygmalab/Bazecor/blob/development/src/main/utils/udev.ts#L6C1-L6C284
    install -Dm644 "${srcdir}/10-dygma.rules" "${pkgdir}/etc/udev/rules.d/10-dygma.rules"
}
