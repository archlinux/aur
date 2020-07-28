# Maintainer: Peter Gerhards <mail@peterge.de>

_pkgname=Jellyamp
pkgname=jellyamp-appimage
pkgver=0.9.6
pkgrel=1
pkgdesc="A stylish, cross-platform desktop client for listening to music from a Jellyfin server. Inspired by Plexamp."
provides=('jellyamp')
conflicts=('jellyamp')
arch=('x86_64')
url="https://github.com/m0ngr31/jellyamp"
license=("MIT")
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/m0ngr31/jellyamp/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}.AppImage"
               "https://raw.githubusercontent.com/m0ngr31/jellyamp/v${pkgver}/LICENSE"
       )
noextract=("${_appimage}")
sha256sums=('54ca6e39c329cc6a1f4b21ff56148588810af8ffe23fcb54dbe657556a99df93'
            'b801c8d677ef9701149e05cf98f28b82a56832dd67c94d96d36d25d063b1b353')

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
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

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
