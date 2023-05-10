# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=prusa-slicer-gtk2-bin
_pkgname="${pkgname%-gtk2-bin}"
pkgver=2.6.0.alpha6
_pkgver=2.6.0
_pkgdate="202303311518"
pkgrel=2
pkgdesc="G-code generator for 3D printers (GTK2 binary)"
arch=('x86_64')
url="https://github.com/prusa3d/PrusaSlicer"
license=('AGPL3')
conflicts=("$_pkgname" 'prusa-slicer-git')
provides=("$_pkgname")
options=('!strip')
_appimage="PrusaSlicer-${_pkgver}.AppImage"
noextract=("${_appimage}")
source=(
    "${_appimage}::${url}/releases/download/version_${_pkgver}-alpha6/PrusaSlicer-${_pkgver}-alpha6+linux-x64-GTK2-${_pkgdate}.AppImage"
)
sha256sums=('dbb6134e16120d2d9ae19bba7b548e99625a7b180395ea27ea4e9401ef364019')

prepare() {
    chmod +x ${srcdir}/${_appimage}
    ${srcdir}/${_appimage} --appimage-extract PrusaSlicer.desktop
    ${srcdir}/${_appimage} --appimage-extract 'usr/bin/resources/icons/PrusaSlicer_*px.png'
    ${srcdir}/${_appimage} --appimage-extract 'usr/bin/resources/icons/PrusaSlicer-gcodeviewer_*px.png'
}

package() {
    install -Dm 755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -Dm 644 "${srcdir}/squashfs-root/PrusaSlicer.desktop" \
        -t "${pkgdir}/usr/share/applications"
    for i in 32 128 192 ; do
        install -Dm 0644 "${srcdir}/squashfs-root/usr/bin/resources/icons/PrusaSlicer_${i}px.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/PrusaSlicer.png"
        install -Dm 0644 "${srcdir}/squashfs-root/usr/bin/resources/icons/PrusaSlicer-gcodeviewer_${i}px.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/PrusaSlicer-gcodeviewer.png"
    done
    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
}
