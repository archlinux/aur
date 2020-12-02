# Maintainer: grant0417 <grant0417 at protonmail dot com>

_pkgname=ff-password-exporter
pkgname=ff-password-exporter-appimage
pkgver=1.2.0
pkgrel=1
pkgdesc="Easily export your passwords from Firefox."
arch=('x86_64')
url="https://github.com/kspearrin/ff-password-exporter"
license=('GPL')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/kspearrin/ff-password-exporter/releases/download/v${pkgver}/FF-Password-Exporter-${pkgver}-x86_64.AppImage"
               "https://raw.githubusercontent.com//kspearrin/ff-password-exporter/v${pkgver}/LICENSE.txt"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('05f346239391ee5ec13ca73cf05aff0e03455709756896bd3e331b28c713568f'
                   '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')


prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
