# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Lili1228 <aur at lili dot lgbt>

_pkgname=86Box
_build=b6130

pkgname=86box-appimage
pkgver=4.2.1
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

sha512sums_pentium4=('1a69f53a1223d522bf9c56df4526d5cc1060a66219267fa48becc5465d1b7934209624f7f129f7c93f7bb9cf1723ac28bb1850a095251cccb4ea8357c01a283b')
sha512sums_x86_64=('0c00e44aff9c00581a88de3a61572a0f4cd5ba310b1c07905b7c4abf6c89e717d1fa93deb6e3846a33b2cac7cff8a022f91b7a1c4f2afeb7f1fdfa83abd14da6')
sha512sums_armv7h=('c6350d07b30323399a6e361748a14230f52b44f9c9a54a036563e40fc03ace8a2892687f411c0c93f975f43b45bd62da36864260e14dea30da10ee3222efa8ad')
sha512sums_aarch64=('71db79d1449f3b5d36cff2c2fc3fb3a76ff06275cc84cf70524dd3867cc288e5030faddb3b377135a302ee87bb4569f277ff8494b2d5e017fabfb81f9a735b45')


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
