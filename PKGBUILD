# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Lili1228 <aur at lili dot lgbt>

_pkgname=86Box
_build=b9001

pkgname=86box-appimage
pkgver=6.0
pkgrel=1
pkgdesc='An emulator for classic IBM PC clones'
arch=('x86_64' 'aarch64') # check https://ci.86box.net/job/86Box/6138/ for pentium4 and armv7h
url='https://86box.net/'
license=('GPL-2.0-or-later')
depends=('fuse2')
optdepends=('86box-roms: ROM files')
provides=("86box")
conflicts=("86box")
options=(!strip)
_source="https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/86Box"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.appimage::${_source}-Linux-x86_64-${_build}.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.appimage::${_source}-NDR-Linux-arm64-${_build}.AppImage")

sha256sums_x86_64=('535d3c329f8c32b601103970c86d80aa80298f345452c3524ea2f433624727a4')
sha256sums_aarch64=('da1f0c733d7a35059f153398d9978574d38e80019256b336dda9aaca9453a143')


prepare() {
    chmod +x "${_pkgname}-${pkgver}-${CARCH}.appimage"
    "./${_pkgname}-${pkgver}-${CARCH}.appimage" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=.*$|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/net.86box.${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}
package() {
    # AppImage
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}.appimage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file                          why
    install -Dm644 "${srcdir}/squashfs-root/net.86box.${_pkgname}.desktop"\
            -t "${pkgdir}/usr/share/applications"

    # Icon images
    cp -R "${srcdir}/squashfs-root/usr/share/icons" "$pkgdir/usr/share"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/86Box"
}
