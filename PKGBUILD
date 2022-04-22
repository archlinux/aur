# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: oscareczek <oscareczek at gmail dot com>

_pkgname=86box
_build=b3738

pkgname="${_pkgname}-appimage"
pkgver=3.4.1
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
sha512sums_pentium4=('02de96502e6d3ec8a03408d7885089c22e6674f9509a105e83660318a9b8f513565062366681b54af18b3c4d7f93f170b9033f6d4a07a6e09d73e8b9ad1ec2d1')
sha512sums_x86_64=('2f775fd26daa346781abc48b45c8a54210024098f4078606ffd255759c8bf4027243bda1bec43f9eaf30d516cfb92524a2b0aa166cef0caae5c53dc2622497f6')
sha512sums_arm7h=('359528dd0d2622db56c0d5a23794dbe46b48e305c26a243c21eb722a16d44cdcc085a255139d176e149b4db66f2c4f0ae1f6decb416ba77e33000f189d5f4147')
sha512sums_aarch64=('7e1a9eb25cd497785cfd9be9f429483ff27e23ec0990ca4a564fefa14c61d658990eee207ee4bb55ff5b2496421b9b7bae03c71459ce4c2039356240779d6ae3')

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
