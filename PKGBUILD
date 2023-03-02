# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
pkgname=into-cps-application-bin
_pkgname=INTO-CPS-application
pkgver=4.0.5
pkgrel=3
pkgdesc="Frontend of the INTO-CPS Tool Chain"
arch=('x86_64')
url="https://github.com/INTO-CPS-Association/into-cps-application"
license=('unknown')
provides=('into-cps-application')
_appimage="${_pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/INTO-CPS-Association/$_pkgname/releases/download/v$pkgver/${_appimage}")
sha256sums=('6d7650d4c85289ddb0509271ef5185a046beb1c4a485d778cfa9cee45d7d6f40')
options=(!strip)

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" "squashfs-root/into-cps-app.desktop"
    
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/into-cps-app.desktop" "${pkgdir}/usr/share/applications/into-cps-app.desktop"
  
    # Icon images
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512"
    cp -a "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps" "${pkgdir}/usr/share/icons/hicolor/512x512"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

}

