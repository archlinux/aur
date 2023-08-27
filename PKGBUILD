# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Lili1228 <aur at gramywpsl dot pl>

_pkgname=86Box
_build=b5000

pkgname=86box-appimage
pkgver=4.0
pkgrel=1
pkgdesc='An emulator for classic IBM PC clones'
arch=('pentium4' 'x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=(GPL2)
depends=('fuse2')
optdepends=('86box-roms: ROM files')
provides=("86box")
conflicts=("86box")
options=(!strip)
_source="https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/86Box"
source_pentium4=("${_pkgname}-${pkgver}-pentium4.appimage::${_source}-Linux-x86-${_build}.AppImage")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.appimage::${_source}-Linux-x86_64-${_build}.AppImage")
source_arm7h=("${_pkgname}-${pkgver}-arm7h.appimage::${_source}-NDR-Linux-arm32-${_build}.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.appimage::${_source}-NDR-Linux-arm64-${_build}.AppImage")
sha512sums_pentium4=('5898b11495eb57259e20415f8caf2014703d6a620d36b73d857e6fd30ea198375299c959bad2481308ca2bec35c39b566ac5c627a1ee040167a53f52f3bd968a')
sha512sums_x86_64=('cf65e7b5cd122dc759e8eeecb6d213dcb22d0d07fb065f2ad908b06ade036dbdff25982a26ca6ffe3f9e8717007c0428ae246a8ec5398c99f0f4b82650a2a23f')
sha512sums_arm7h=('80ab3c67db83a44bc9deef0ee9c2d4fdeed6909ad821008733ec76bda8bab823c8b40e541ef62e3a9fee9210b578bcf365086e629b16f2e46b13ad942949d80f')
sha512sums_aarch64=('45e727a8efdafa1582f302d6d914968c25332eb798a28928e6ba8fc4a199bfe2c59609dba9d88b09d241f6d57deb3fe821deae21d7364302d09945c3d53b06f2')

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
