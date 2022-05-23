# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: oscareczek <oscareczek at gmail dot com>

_pkgname=86box
_build=b3777

pkgname="${_pkgname}-appimage"
pkgver=3.5
pkgrel=1
pkgdesc='An emulator for classic IBM PC clones'
arch=('pentium4' 'x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=(GPL2)
depends=('fuse2')
optdepends=('86box-roms: ROM files')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
_source="https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/86Box"
source_pentium4=("${_pkgname}-${pkgver}-pentium4.appimage::${_source}-Linux-x86-${_build}.AppImage")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.appimage::${_source}-Linux-x86_64-${_build}.AppImage")
source_arm7h=("${_pkgname}-${pkgver}-arm7h.appimage::${_source}-NDR-Linux-arm32-${_build}.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.appimage::${_source}-NDR-Linux-arm64-${_build}.AppImage")
sha512sums_pentium4=('e63aa9d6118d9567695380794ef3d39fb71c11e0b2062875a9672498b6118fa511ac0a93f34934355fd22847270539de7f4dcb8cb58f1e13c2eb2459da21da18')
sha512sums_x86_64=('a127b909ec0210988e1be871bff0d3c0f545f4f3aa08339b6992a7565e01b06b8bbbb4972ad930ef4eb124a01c7adcac2dc22b4087876237c51da2d90f9379f9')
sha512sums_arm7h=('91017f050baa9911136cb370a9bcdbb699b47fb9ca6bf16b1cfd0f1b5a62d06d84769c5e3dbb4eb5b78d2e7691a107f67d49a0ec7a6fb887b55b35b66bf1fac7')
sha512sums_aarch64=('c1665f16aaa0c9a2c0eb3729332665ff636ecba100571c3b9d1bea48b353ea6bae7113d95f53113bab049bc0e51a75cfccf026bdb9b155610039c974ae5b06fe')

prepare() {
    chmod +x "${_pkgname}-${pkgver}-${CARCH}.appimage"
    "./${_pkgname}-${pkgver}-${CARCH}.appimage" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/net.${_pkgname}.86Box.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}
package() {
    # AppImage
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}.appimage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file                          why
    install -Dm644 "${srcdir}/squashfs-root/net.${_pkgname}.86Box.desktop"\
            -t "${pkgdir}/usr/share/applications"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/86Box"

    # Symlink to roms folder from 86box-roms
    ln -s "/usr/share/86Box/roms" "${pkgdir}/opt/${pkgname}/roms"
}
