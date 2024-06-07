# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=superslicer-bin
pkgver=2.5.59.11
_pkgtag=$pkgver
_appimage=SuperSlicer-ubuntu_20.04-$_pkgtag.AppImage
pkgrel=1
pkgdesc="G-code generator for 3D printers (Creality, RepRap, Makerbot, Ultimaker etc.) (binary AppImage)"
arch=('x86_64')
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('zlib' 'fuse2' 'glu')
options=('!strip' '!debug')
replaces=('slic3r++')
conflicts=('superslicer' 'superslicer-git' 'superslicer-prerelease')
source=("$url/releases/download/$_pkgtag/$_appimage"
        "superslicer.patch"
        )
sha256sums=('741c35182afe5ae63ff09f3cb58f4c4797c9c81bc793166784f81a19d29c7701'
            'a2d8092e5ec12e96d487d55b564f56c2df5bd41a3be066734b94465695a6c404')
b2sums=('4cb88a690f7d38f8093d7f352be517ee621525406459b4f167544407a1ba19db172e96dd5a7e151a9d9ed1b97e27131ddbc5afb9f6f44d906e86d06b01cf6625'
        '7547a6cc945948e637413b55af6a5a68fb6c08e8d5b3c03b137134cc5ed4f399b3d666985be5c2103240d3ae56d591ab9f02b5237a01978d422673247fef7061')
noextract=("${_appimage}")

prepare() {
    chmod +x ${srcdir}/${_appimage}
    ${srcdir}/${_appimage} --appimage-extract SuperSlicer.desktop
    ${srcdir}/${_appimage} --appimage-extract 'resources/icons/SuperSlicer_*px.png'
}

build() {
    # Update version in patch file
    sed -i "s/pkgver/${pkgver}/" ${srcdir}/superslicer.patch

    # Patch .desktop so it will work outside of AppImage container
    patch -Np0 < ${srcdir}/superslicer.patch

    # Fix permissions; .AppImage permissions are 700 for all directories
    #chmod -R a-x+rX squashfs-root/resources
}

package() {
    # AppImage
    install -Dm 755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
    #install -dm 755 "${pkgdir}/opt/${pkgname}/"
    #cp "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    # Desktop file
    install -Dm 644 "${srcdir}/squashfs-root/SuperSlicer.desktop"\
            "${pkgdir}/usr/share/applications/SuperSlicer.desktop"

    # Icon images
    # Copy icons
    for i in 32 128 192 ; do
        install -Dm 0644 "${srcdir}/squashfs-root/resources/icons/SuperSlicer_${i}px.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/SuperSlicer.png"
    done

    # Symlink executable
    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/superslicer"
}
