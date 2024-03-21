# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Lili1228 <aur at lili dot lgbt>

_pkgname=86Box
_build=b5634

pkgname=86box-appimage
pkgver=4.1.1
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

sha512sums_pentium4=('125a7f298ad53452462bd771631d69babd53a24a38e03d451dcb2ee77c6acfddc60aa306c5cd911335396acaac36be8db72a69ec6ada311b333d0e21ff6689b5')
sha512sums_x86_64=('5f359a7d12816245713ee2764f1d12594b3c7a60a384a6e092e571469ff58afa4a7f8f890c898ee87e4fdff9901765cbdab0cda3e39e688d87505c31a85b241e')
sha512sums_armv7h=('5a2a4dce09860fc192b1df8b2e9f6022584f71a903ab6cc3a6f199ab669d93a9f9a4a36000f8a590977a79dfce53c26183811bbeebbba94366cf518b201bae56')
sha512sums_aarch64=('1bb2e59ea82d7b1e91009a733662029a37f5b781f761d2cc1014c3cdc47a436fd7551ab7bd4b87214388ffdf57e918105d6dd5b530e39f78f37df51a0fee8414')


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
