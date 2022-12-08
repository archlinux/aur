# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=prusa-slicer-gtk2-bin
_pkgname="${pkgname%-gtk2-bin}"
pkgver=2.5.0
_pkgdate=202209060714
pkgrel=1
pkgdesc="G-code generator for 3D printers (GTK2 binary)"
arch=('x86_64')
url="https://github.com/prusa3d/PrusaSlicer"
license=('AGPL3')
conflicts=("$_pkgname" 'prusa-slicer-git')
provides=("$_pkgname")
depends=('zlib' 'fuse' 'glu' 'gtk2')
options=('!strip')
_appimage="PrusaSlicer-${pkgver}.AppImage"
noextract=("${_appimage}")
source=(
    "${_appimage}::${url}/releases/download/version_${pkgver}/PrusaSlicer-${pkgver}+linux-x64-GTK2-${_pkgdate}.AppImage"
    'prusa-slicer.patch'
    'prusa-gcode.patch'
)
sha256sums=('5850e6d8a1fbba0a72e4a4491e993068628bafa7033ac7dc921ec24103235da5'
            '2a286cb975a16b04a35d7a308340bea42a7e09521fe4044eb73567ca5cf8a078'
            'd4bd40600dba72286081fda53c8d6fa50b927cfdf07a571538e769ee133be381')

prepare() {
    chmod +x ${srcdir}/${_appimage}
    ${srcdir}/${_appimage} --appimage-extract PrusaSlicer.desktop
    ${srcdir}/${_appimage} --appimage-extract 'usr/bin/resources/icons/PrusaSlicer_*px.png'
    ${srcdir}/${_appimage} --appimage-extract 'usr/bin/resources/icons/PrusaSlicer-gcodeviewer_*px.png'
}

build() {
    # Patches
    patch -Np0 -i ${srcdir}/prusa-slicer.patch -o "${srcdir}/PrusaSlicer.desktop"
    patch -Np0 -i ${srcdir}/prusa-gcode.patch -o "${srcdir}/PrusaGcodeViewer.desktop"
}

package() {
    install -Dm 755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -Dm 644 "${srcdir}/PrusaSlicer.desktop" \
        -t "${pkgdir}/usr/share/applications"
    install -Dm 644 "${srcdir}/PrusaGcodeViewer.desktop" \
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
