# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Lili1228 <aur at lili dot lgbt>

_pkgname=86Box
_build=b5555

pkgname=86box-appimage
pkgver=4.1
pkgrel=1
pkgdesc='An emulator for classic IBM PC clones'
arch=('pentium4' 'x86_64' 'armv7h' 'aarch64')
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
source_armv7h=("${_pkgname}-${pkgver}-arm7h.appimage::${_source}-NDR-Linux-arm32-${_build}.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.appimage::${_source}-NDR-Linux-arm64-${_build}.AppImage")

sha512sums_pentium4=('32db05bb016bae985779fb3a2177aebe17b4aa4d345aad95706fffcc5aa27da72abb7a3fca6c373bcd5acabe1343b9c3746fa53e8b5d49b89b1336ecee5b18e3')
sha512sums_x86_64=('56623db42e90a6587ddc6c0fd85f16f569cda8a702da13a7e1a56dbee5056816fcc60257f4ff3f4f3f394809b1043385d4c92d975a2e7e4b4d3ee5ebf0c73d39')
sha512sums_armv7h=('cdad8f6bed934897aa67fff81a1a4084e82dacc5ff8c03d1e10c0958eea34ff52247c08963c5cfb60047700c968861c590b9780f048ff493dde78e0c3428b79f')
sha512sums_aarch64=('49a315d26c7632ee9d625622b24d7dccb419733f277ca127ec792ed99da049cd80f5502177df3d505cae4ea82c7d1d8f30826fa59289a49013233ca019773ca1')

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
