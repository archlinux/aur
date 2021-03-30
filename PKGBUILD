# Maintainer: qvshuo

_pkgname=olive-editor
pkgname=olive-appimage
pkgver=f99600ed
pkgrel=1
pkgdesc="Olive is a free non-linear video editor for Windows, macOS, and Linux."
arch=('x86_64')
url="https://olivevideoeditor.org"
license=('GPL3')
depends=( 'fuse')
options=(!strip)
_appimage="Olive-${pkgver}-Linux-x86_64.AppImage"
source=(${url}/dl/${_appimage})
noextract=("${_appimage}")
md5sums=('0c40c78f815d281f32ab33c23a1145a4')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
        "squashfs-root/org.olivevideoeditor.Olive.desktop"
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/org.olivevideoeditor.Olive.desktop"\
            "${pkgdir}/usr/share/applications/org.olivevideoeditor.Olive.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
