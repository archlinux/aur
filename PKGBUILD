# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: oscareczek <oscareczek at gmail dot com>

_pkgname=86box
_build=b3602

pkgname="${_pkgname}-appimage"
pkgver=3.2.1
pkgrel=1
pkgdesc='Emulator of x86-based machines based on PCem.'
arch=('x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=(GPL2)
depends=('fuse2')
optdepends=('86box-roms: ROM files')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
_source="https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/86Box"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.appimage::${_source}-Linux-x86_64-${_build}.AppImage")
source_arm7h=("${_pkgname}-${pkgver}-arm7h.appimage::${_source}-NDR-Linux-arm32-${_build}.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.appimage::${_source}-NDR-Linux-arm64-${_build}.AppImage")
sha512sums_x86_64=('a858f3988bac177483e5b3b4e38cfa40827a354f4da380a90c4c661ae648fcecbdb61e7eaa425e1a087d0627d630905fbff2280dad48f467b70f1d12818f7744')
sha512sums_arm7h=('2314afba96b23aa76ab437929f8a65930f2105f158cf783ac4ac67a05c4f56a19ef1202b7e06c32603ce6a2c39e525736e1e5f995fba968e2a954c8922afeed7')
sha512sums_aarch64=('731b6ca430d88a14621b7ebf17a3161744fea3975d715bee9be45cbdbb68615ae32211c86cf8f0534f771e40a98fc5e3868ac246080fcddf986f017d25562d5f')

prepare() {
    chmod +x "${_pkgname}-${pkgver}-${CARCH}.appimage"
    "./${_pkgname}-${pkgver}-${CARCH}.appimage" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/net.${_pkgname}.${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}
package() {
    # AppImage
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}.appimage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file                          why
    install -Dm644 "${srcdir}/squashfs-root/net.${_pkgname}.${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink to roms folder from 86box-roms
    ln -s "/usr/share/${_pkgname}/roms" "${pkgdir}/opt/${pkgname}/roms"
}
