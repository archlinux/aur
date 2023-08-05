# Maintainer: HIDE-r <lkangn.collin@gmail.com>
pkgname=keycombiner
pkgver=0.8.0
pkgrel=2
pkgdesc="An app to organize, learn, and practice keyboard shortcuts!"
arch=("x86_64")
url="https://keycombiner.com"
license=('custom')
options=(!strip)
depends=('fuse2')
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://keycombiner.com/download/KeyCombiner-${pkgver}.AppImage")
noextract=("${_appimage}")
sha256sums=("377348e207c5614d600ca0ca2da588fd78206ea52cd7d115d7ca0086b179bbff")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon 
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
