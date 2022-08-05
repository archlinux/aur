# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: oscareczek <at gmail dot com>

_pkgname=86box
_build=b4032

pkgname="${_pkgname}-appimage"
pkgver=3.7.1
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
sha512sums_pentium4=('0fae69d5415bb792e0153fb4e8f641ad1f135abdac49edb09ae34b8218f861561dd5719ef0e87d08a72317f54c3b2f0305d2810cc8de616593b924b2d247cbaf')
sha512sums_x86_64=('3849f5f61e0780aa06d645c5a5f1c3b1704659613644de6371dbec66a37973ec554083d990a7ad1f47c84716108fbdf6eab436c0a7eb0266ec9b6535ddd84c87')
sha512sums_arm7h=('edc754d6d9eb99c2565f9594fe17816ce8b1c9e98084c073eb6cac27a64474fdd42a42c2c6c7d820d9ae96b557f60d86471ca77af4f8c61ce9d465212421a0af')
sha512sums_aarch64=('f8e41834f00e78520c51d51d69b6d9cfd8ad69cbb14320408944eb88e978d93ed122b9d3b3ec2b8dfd3bbaab3938d61ab87d1178a5bf8b6bf203e26d32784663')

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
