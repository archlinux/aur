# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: timochan <i@timochan.cn>

_pkgname=yakit
_Pkgname=Yakit
_disname=yakit

pkgname="${_pkgname}"-appimage
pkgver=1.2
pkgrel=1
pkgdesc="Cyber Security ALL-IN-ONE Platform"
arch=('x86_64')
url="https://github.com/yaklang/yakit"
license=('custom')
options=(!strip)
depends=('zlib' 'hicolor-icon-theme' 'fuse2' )
provides=('yakit-bin')


source_x86_64=("${_Pkgname}-${pkgver}-x86_64.AppImage::https://github.com/yaklang/yakit/releases/download/v${pkgver//_/-}.${pkgrel}-sp5/${_Pkgname}-${pkgver//_/-}.${pkgrel}-sp5-linux-amd64.AppImage")
sha256sums_x86_64=('735fb2d221cb9499152a9ccdac2ee35cd1b1fd654ab61759a1e58f5f429fab05')


_appimage="${_Pkgname}-${pkgver}-${arch}.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
        "squashfs-root/${_disname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_disname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    ln -s "$(realpath ${srcdir}/squashfs-root/${_disname}.png  --relative-to ${srcdir}/squashfs-root/usr/share/icons)"\
        "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}