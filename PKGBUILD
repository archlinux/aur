# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=prusa-slicer-bin
_pkgname="${pkgname%-bin}"
pkgver=2.4.2_rc2
_pkgver="${pkgver//_/-}"
_pkgdate=202204131353
pkgrel=1
pkgdesc="G-code generator for 3D printers (binary AppImage, includes rc releases)"
arch=('x86_64')
url="https://github.com/prusa3d/PrusaSlicer"
license=('AGPL3')
conflicts=("$_pkgname" 'prusa-slicer-git' 'prusa-slicer-gtk2')
provides=("$_pkgname")
depends=('zlib' 'fuse')
options=('!strip')
_appimage="PrusaSlicer-${_pkgver}.AppImage"
noextract=("${_appimage}")
source_x86_64=(
    "${_appimage}::${url}/releases/download/version_${_pkgver}/PrusaSlicer-${_pkgver}+linux-x64-GTK3-${_pkgdate}.AppImage"
    'prusa-slicer.patch'
    'prusa-gcode.patch'
)
sha256sums_x86_64=('5af3a12d290a986ec99e4cfd8e162100f9f4da464d52eb1da5ccf97f058aa308'
                   '4c70f1b7e9fcc327fee70d5632fe1c8c3ea5c3d48c7f9998571631559d5d5010'
                   'a4133d2c1e171f55eecaeab9bae16b1f83843f30960830305235401d3662a043')

prepare() {
    chmod +x ${srcdir}/${_appimage}
    ${srcdir}/${_appimage} --appimage-extract PrusaSlicer.desktop
    ${srcdir}/${_appimage} --appimage-extract 'usr/bin/resources/icons/PrusaSlicer_*px.png'
    ${srcdir}/${_appimage} --appimage-extract 'usr/bin/resources/icons/PrusaSlicer-gcodeviewer_*px.png'
}

build() {
    # Patch desktop files so it will work outside of AppImage container
    patch -Np0 -i ${srcdir}/prusa-slicer.patch -o "${srcdir}/PrusaSlicer.desktop"
    patch -Np0 -i ${srcdir}/prusa-gcode.patch -o "${srcdir}/PrusaGcodeViewer.desktop"
}

package() {
    # Install AppImage
    install -Dm 755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${_pkgname}/${_appimage}"
    # Install Desktop file
    install -Dm 644 "${srcdir}/PrusaSlicer.desktop" \
        -t "${pkgdir}/usr/share/applications"
    install -Dm 644 "${srcdir}/PrusaGcodeViewer.desktop" \
        -t "${pkgdir}/usr/share/applications"
    # Copy icons
    for i in 32 128 192 ; do
        install -Dm 0644 "${srcdir}/squashfs-root/usr/bin/resources/icons/PrusaSlicer_${i}px.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/PrusaSlicer.png"
        install -Dm 0644 "${srcdir}/squashfs-root/usr/bin/resources/icons/PrusaSlicer-gcodeviewer_${i}px.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/PrusaSlicer-gcodeviewer.png"
    done
    # Symlink executable
    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
}
