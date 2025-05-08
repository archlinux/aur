# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Stephan Brunner <stepbrunner@gmail.com>

_pkgname=chataigne
_Pkgname=Chataigne

pkgname="${_pkgname}"-beta-bin
pkgver=1.9.25b12
pkgrel=1
pkgdesc="Artist-friendly Modular Machine for Art and Technology."
arch=('x86_64')
url="https://benjamin.kuperberg.fr/chataigne/en"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'curl' 'bluez-libs' 'freetype2' 'libx11' 'libxinerama' 'libxrandr' 'libxcursor' 'libxcomposite' 'mesa' 'alsa-lib' 'freeglut' 'jack' 'gtk3' 'webkit2gtk' 'sdl2' 'libusb' 'hidapi' 'nss' 'ttf-bitstream-vera' 'libcurl-gnutls')
conflicts=(chataigne-stable-bin)
options=(!strip)
_appimage="${_Pkgname}-linux-x64-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://benjamin.kuperberg.fr/chataigne/user/data/${_appimage}")
noextract=("${_appimage}")
sha256sums_x86_64=('844df5f96cf75cf8fed2874a337f9db84ae53c2d51841daf17c6b93ca534132f')

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

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    cp -a "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_Pkgname}"
}
