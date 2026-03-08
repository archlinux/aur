# Maintainer: Taha Bhagat <tahabhagat8@gmail.com>

_pkgname=pearl

pkgname="${_pkgname}-appimage"
pkgver=1.4.4.rc2
pkgrel=1
pkgdesc="Pearl - Olas Operate App"
arch=('x86_64')
url="https://github.com/valory-xyz/olas-operate-app"
license=('Apache-2.0')
depends=('zlib-ng-compat' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/valory-xyz/olas-operate-app/releases/download/v${pkgver//.rc/-rc}/Pearl-${pkgver//.rc/-rc}-linux-${CARCH}.AppImage"
               "https://raw.githubusercontent.com/valory-xyz/olas-operate-app/refs/tags/v${pkgver//.rc/-rc}/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('ec4716feb091b0e9271c2f818e81c2e0ae77206ccbbe7ef88c7506245214c46d'
                   '99d04307e996295e42cf87a30730622aa6a7e99f3354b021f71c0ceb83b6156e')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        "squashfs-root/olas-operate-app.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/olas-operate-app.desktop" \
        "${pkgdir}/usr/share/applications/olas-operate-app.desktop"

    # Icon
    install -Dm644 "${srcdir}/squashfs-root/olas-operate-app.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/olas-operate-app.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
