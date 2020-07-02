# Maintainer: Joosep Jääger <joosep.jaager@gmail.com>

_pkgname=timenaut

pkgname="${_pkgname}"-appimage
pkgver=0.4.0
pkgrel=1
pkgdesc="Desktop time tracking application that does not invade your privacy"
arch=('x86_64')
url="https://timenaut.app/"
license=("GPL")
depends=('zlib' 'fuse2')
options=(!strip)
source_x86_64=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/kmteras/timenaut/releases/download/v${pkgver}/Timenaut-${pkgver}.AppImage"
  "https://raw.githubusercontent.com/kmteras/timenaut/v${pkgver}/LICENSE"
  )
_appimage="${pkgname}-${pkgver}.AppImage"
noextract=("${_appimage}")
sha256sums_x86_64=(
  '405eea566eca8173cde889daf961e1b0ac6e997fd9bf7d485e4e017c9c91f610'
  '60c8bebc623ef8011c51ac2cfd70539c1882bcd6e2a103714b48861b8481438c')

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
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
