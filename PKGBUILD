# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Lili1228 <aur at lili dot lgbt>

_pkgname=86Box
_build=b6000

pkgname=86box-appimage
pkgver=4.2
pkgrel=1
pkgdesc='An emulator for classic IBM PC clones'
arch=('pentium4' 'x86_64' 'armv7h' 'aarch64')
url='https://86box.net/'
license=('GPL-2.0-or-later')
depends=('fuse2')
optdepends=('86box-roms: ROM files')
provides=("86box")
conflicts=("86box")
options=(!strip)
_source="https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/86Box"
source_pentium4=("${_pkgname}-${pkgver}-pentium4.appimage::${_source}-Linux-x86-${_build}.AppImage")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.appimage::${_source}-Linux-x86_64-${_build}.AppImage")
source_armv7h=("${_pkgname}-${pkgver}-arm7h.appimage::${_source}-NDR-Linux-arm32-${_build}.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.appimage::${_source}-NDR-Linux-arm64-${_build}.AppImage")

sha512sums_pentium4=('64b59c5b2538ed214f7a211965f86bb61aa5b61a764b6fb59e6cab6fcfc1ceabd5e708444e10b6c157e3a3fd0b659088410252f727371703263f486a7157fd01')
sha512sums_x86_64=('e21c55c8299df3f86b1364df282fedf0074c93b9ca4f4193005d20e2e8ad96d8178b60c9627f8e8355e94936153bd369fc017f775b28d642a7897a94742aa02d')
sha512sums_armv7h=('8867e3d17b968addbb73d9dfcebf4c41feb4ad5790309d0016758b8c5c32e34a6eb3269c0ea6a5544d93c6c8cb4c8d331f9ddd09a73a5048910feb7680375299')
sha512sums_aarch64=('9b42fa8e3189e27a9dd8f2e0805b8da8e39f180db41f8dcb1651e90d249046a2ce4f1042cdf3d0934869f4da1a498f09a8f6369ff68d0dbd29d70999e2724265')


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

    # Symlink to roms folder from 86box-roms
    ln -s "/usr/share/86Box/roms" "${pkgdir}/opt/${pkgname}/roms"
}
