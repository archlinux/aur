# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Lili1228 <aur at gramywpsl dot pl>

_pkgname=86Box
_build=b5111

pkgname=86box-appimage
pkgver=4.0.1
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
sha512sums_pentium4=('66502116fe111ee01b5e94dca0bdcc85c5d513fb702cfbff5360c519efccfba1ef6d7217da258366d3c992ff08b4103ef2fae55fc9cff516e612d233fc8a1a2a')
sha512sums_x86_64=('7171d146bf800ae6e9421fd62f6e0f232ada734e73daf8bbbfece3a8ee2ae4ec57fa826d44fe74f3a0d565341ae308070011807fd936dae4f1ef4b54d2233247')
sha512sums_arm7h=('eec8f209092dc2e5a247db762c2a7614cc7a82bdeda134a19c3342113ccfbcd7583807eeaae5abc69e844a0df47e967b359dad2f309b5d2a63c291e1ce2745dd')
sha512sums_aarch64=('755efaee7ca16cb1f7404ef229ca55260a215a10f4c4d9a90cca75b7d7ced4acf89ea6d4dada7a9b86c61366b7e36178b912f499c52ebd7a081b2b50ef63d3c7')

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
