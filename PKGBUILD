# Maintainer: José Joaquín Zubieta Rico <flyingspaghetti@airmail.cc>

_pkgname=xelfviewer

pkgname=${_pkgname}-appimage
pkgver=0.05
pkgrel=1
pkgdesc='ELF file viewer/editor for Windows, Linux and MacOS'
arch=('x86_64')
url='https://github.com/horsicq/XELFViewer'
license=('MIT')
depends=('gcc-libs')
options=(!strip)
_appimage="XELFViewer-${pkgver}-${arch}.AppImage"
source=("https://github.com/horsicq/XELFViewer/releases/download/${pkgver}/${_appimage}")
noextract=("${_appimage}")
sha512sums=('ff0ae9b3854d7221c0f93fcffdba5c8e42141883626e13513f0837508798f5b9855124e9aa438e3228e64342fa77e2b8deacfed909a8941d0e7760c7edb390ae')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    # sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
    #     "squashfs-root/${_pkgname}.desktop"
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
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
