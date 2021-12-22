# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=superslicer-bin
pkgver=2.3.57.8
_pkgtag=$pkgver
_appimage=SuperSlicer-ubuntu_18.04-gtk3-$_pkgtag.AppImage
pkgrel=1
pkgdesc="G-code generator for 3D printers (Creality, RepRap, Makerbot, Ultimaker etc.) (binary AppImage)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('zlib' 'fuse2' 'glu')
options=('!strip')
replaces=('slic3r++')
#provides=("superslicer=$pkgver")
conflicts=('superslicer' 'superslicer-git' 'superslicer-prerelease')
source=("$url/releases/download/$_pkgtag/$_appimage"
        "superslicer.patch"
        )
sha256sums=('0c2791b30eab179eca3309fc6accedbd65997b79114ec61dfcbb24ff4283e0e4'
            '48a9b58754b02d1ec94a4234644a731708a825ef4d50002bdef94db4ae0815d3'
	    )
noextract=("${_appimage}")

prepare() {
    chmod +x ${srcdir}/${_appimage}
    ${srcdir}/${_appimage} --appimage-extract Slic3r.desktop
    ${srcdir}/${_appimage} --appimage-extract resources/icons
}

build() {
    # Update version in patch file
    sed -i "s/pkgver/${pkgver}/" ${srcdir}/superslicer.patch

    # Patch .desktop so it will work outside of AppImage container
    patch -Np0 < ${srcdir}/superslicer.patch

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/resources
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/Slic3r.desktop"\
            "${pkgdir}/usr/share/applications/SuperSlicer.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/resources/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/superslicer"
}
