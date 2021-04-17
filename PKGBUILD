# Maintainer: Karthick <kkzone@gmail.com>

_pkgname=thoptv

pkgname="${_pkgname}"
pkgver=46.1.0
pkgrel=1
pkgdesc="Thoptv  is the best source to enjoy Ultimate Movies,  sports Matches, IPL and Latest Shows, radio and many much more thing’s.it’s totally free of cost you don’t need to pay any single to use this application it has a premium plan."
arch=('x86_64')
url="https://github.com/kkdops/thoptv/"
license=('custom:Unlicense')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/kkdops/thoptv/releases/download/${pkgver}/${_pkgname}.${pkgver}.AppImage"
               "https://raw.githubusercontent.com/kkdops/thoptv/${pkgver}/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('268af89aa50b96622da295e40b4ff278d89b5d6448cdbd6e5b87343df0165690'
                   '6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e')

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
