# Maintainer: crosant <crosant@crosant.de>

_pkgname=fflogs-uploader
pkgname=${_pkgname}-bin
pkgver=9.0.24
pkgrel=1
pkgdesc="FFLogs Uploader - pre-built binary AppImage"
arch=('x86_64')
url="https://github.com/RPGLogs/Uploaders-fflogs"
license=('LicenseRef-fflogs-uploader')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('fflogs-uploader')
conflicts=('fflogs-uploader-appimage')
options=(!strip)
_appimage="fflogs-v${pkgver}.AppImage"
source_x86_64=("${_appimage}::${url}/releases/download/v${pkgver}/fflogs-v${pkgver}.AppImage"
               "${_pkgname}.desktop")
noextract=("${_appimage}")
sha256sums_x86_64=('f4bf5e3692b6308dcffa68540c20337e2dd80dd5a91c68e2512e4b8e4b148eaa'
                   'a1ab59586d6577ec844caa3ac56239df0f257e779fb2fbfd5c2a39353750676c')

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
    install -Dm644 "${srcdir}/${_pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icons
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Fix icon size directory name if needed
    if [ -d "${pkgdir}/usr/share/icons/hicolor/512x512" ]; then
        mv "${pkgdir}/usr/share/icons/hicolor/512x512" \
           "${pkgdir}/usr/share/icons/hicolor/256x256"
    fi

    # Rename icon to match what desktop file expects (fflogs.png)
    if [ -f "${pkgdir}/usr/share/icons/hicolor/256x256/apps/fflogs.png" ]; then
        :  # Already correctly named
    elif [ -f "${pkgdir}/usr/share/icons/hicolor/256x256/apps/FF Logs Uploader.png" ]; then
        mv "${pkgdir}/usr/share/icons/hicolor/256x256/apps/FF Logs Uploader.png" \
           "${pkgdir}/usr/share/icons/hicolor/256x256/apps/fflogs.png"
    fi

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
