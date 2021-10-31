# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=superslicer-bin
pkgver=2.3.56.9
_pkgtag=$pkgver
_appimage=SuperSlicer-ubuntu_18.04-$_pkgtag.AppImage
pkgrel=2
pkgdesc="G-code generator for 3D printers (Creality, RepRap, Makerbot, Ultimaker etc.) (binary AppImage)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('zlib' 'fuse2' 'glu')
options=('!strip')
replaces=('slic3r++')
provides=("superslicer=$pkgver")
conflicts=('superslicer' 'superslicer-git' 'superslicer-prerelease')
source=("https://github.com/supermerill/SuperSlicer/releases/download/$_pkgtag/$_appimage"
        "superslicer.patch"
        )
sha256sums=('48dd673c081abb8f7d58b3d5740ddf2e3b46085201a474b695e7c171c7be184e'
            'SKIP'
             )
noextract=("${_appimage}")

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    "${srcdir}"/"${_appimage}" --appimage-extract Slic3r.desktop
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
