# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: oscareczek <oscareczek at gmail dot com>

_pkgname=86box
_build=b3600

pkgname="${_pkgname}-appimage"
pkgver=3.2
pkgrel=2
pkgdesc='Emulator of x86-based machines based on PCem.'
arch=('x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=(GPL2)
depends=('fuse2')
optdepends=('86box-roms: ROM files')
options=(!strip)
_source="https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/86Box"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.appimage::${_source}-Linux-x86_64-${_build}.AppImage")
source_arm7h=("${_pkgname}-${pkgver}-arm7h.appimage::${_source}-NDR-Linux-arm32-${_build}.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.appimage::${_source}-NDR-Linux-arm64-${_build}.AppImage")
sha512sums_x86_64=('dfc7cd587b7a5588dc671d5301d54c887fed7c9dc1b714993dfd717f679e7a51d384cecb48edbfec038c8da002db4cbd82dbff02bd55499ddb6d50b78d0eca17')
sha512sums_arm7h=('3c295965e0ad2a7623a5399952c2baf3ae9610abc07424e5bfd02274c19926a9aff4315c489dccbf209a85df988067e75d78fa20bcc1d66cba03d14b5a59fad1')
sha512sums_aarch64=('3dcc99f1397ce50cea7d40159f6e665b225cbd2fb2cd74c14572a61a52425eaa0529319ca03327d58d773f92a97e6f556c8b0f719c868e440fe40a61e5482b67')
provides=("86box")
conflicts=("86box")

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
