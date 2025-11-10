# Maintainer: Sander Vocke <sandervocke@gmail.com>

_pkgname=shoopdaloop

pkgname="${_pkgname}"-appimage
pkgver=0.2.0
pkgrel=1
pkgdesc="Live looping application with DAW elements"
arch=('x86_64')
url="https://github.com/SanderVocke/shoopdaloop/"
license=('GPL-3.0-or-later')
depends=()
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/SanderVocke/shoopdaloop/releases/download/v0.2.0/shoopdaloop-0.2.0.release-linux-x64.AppImage"
               "https://raw.githubusercontent.com/SanderVocke/shoopdaloop/master/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('a909e850523bcaf4ee329d31fdd22f4ad073ce0a4116996d868a06baea75e4b6'
                   'SKIP')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/*
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon image
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -a "${srcdir}/squashfs-root/shoopdaloop.png" "${pkgdir}/usr/share/icons/shoopdaloop.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
