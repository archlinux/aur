# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: oscareczek <at gmail dot com>

_pkgname=86box
_build=b4008

pkgname="${_pkgname}-appimage"
pkgver=3.7
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
sha512sums_pentium4=('1161934bcd00d56a07a5243d0deb2d1fd8544ee482941b72d476e159217a3e7ff3d615026d1ff7dccf0736dbc430652d9b4e98252154cfe10aacf76591e1e2ed')
sha512sums_x86_64=('ddcac32981b285621852e2a18d054e2d507b6266c02c15274715e0ac7f402ccb88c5e0cd5fac193159ea3c531c6fd804e1f392d90e5630aa1a038b5cae7e9169')
sha512sums_arm7h=('a0115f5dee25c2b25ef006247bd19be0f90af8f114ab02a9dc87ee1cb32f6d5ff2f35aa7aff3cf8c8a1624f57f2ca374288bfb587139f1ec4cedc991fb07d311')
sha512sums_aarch64=('f072aa2a3ad48e137690f319e6d96d37e094dd6cbc96b0082b48e0c8c9bf6dbb4bbb771498b83e6e269add8771d7dce08b5516ed54d220e3c098f82c97b41f27')

prepare() {
    chmod +x "${_pkgname}-${pkgver}-${CARCH}.appimage"
    "./${_pkgname}-${pkgver}-${CARCH}.appimage" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=.*$|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
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
