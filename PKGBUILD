# Maintainer: ssorgatem at gmail dot com
# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=superslicer-prerelease-bin
pkgver=2.7.61.10
_pkgtag=$pkgver
_appimage=SuperSlicer-ubuntu_22.04-$_pkgtag.AppImage
pkgrel=1
epoch=1
pkgdesc="G-code generator for 3D printers (Prusa, Voron, Creality, etc.) (binary AppImage)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('zlib' 'fuse3')
options=('!strip' '!debug')
replaces=('slic3r++')
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-git' 'superslicer-prerelease')
source=("https://github.com/supermerill/SuperSlicer/releases/download/$_pkgtag/$_appimage"
)
sha256sums=('a6d4f78feea4f775bc05980c3641807957f1d2576576a8315f6d720e7bcb6b2c')
noextract=("${_appimage}")


prepare() {
    chmod +x "${_appimage}"
    "${srcdir}"/"${_appimage}" --appimage-extract SuperSlicer.desktop
    "${srcdir}"/"${_appimage}" --appimage-extract 'resources/icons/SuperSlicer_*px.png'
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/superslicer|"\
        "squashfs-root/SuperSlicer.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/resources
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/SuperSlicer.desktop"\
            "${pkgdir}/usr/share/applications/SuperSlicer.desktop"

    # Icon images
    for i in 32 128 192 ; do
        install -Dm 0644 "${srcdir}/squashfs-root/resources/icons/SuperSlicer_${i}px.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/SuperSlicer.png"
    done

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/superslicer"
}
