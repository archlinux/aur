# Maintainer: Nestor Cagnoli <nestor[DOT]cagnoli[at]gmail[DOT]com>
pkgname=cura-5
_pkgname=cura-5
_shortname=cura5
pkgver=5.1.0
pkgrel=0
pkgdesc='Uncompressed version of Ultimaker Cura 5.1'
arch=('x86_64')
url="https://ultimaker.com/software/ultimaker-cura"
license=('LGPL3')
depends=('fuse2' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk')
provides=('cura')
options=(!strip)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(
    "${_pkgname}.AppImage::https://github.com/Ultimaker/Cura/releases/download/${pkgver}/Ultimaker-Cura-${pkgver}-linux.AppImage"
    "${_shortname}.sh"
    "cura.desktop.patch"
)

sha256sums=(
    "SKIP"
    "SKIP"
    "SKIP"
)
   
prepare() {
    sed -i "s/VERSION_PLACEHOLDER/${pkgver}/g" cura5.sh
    cd "${srcdir}"
    chmod +x $PWD/${_pkgname}.AppImage
    $PWD/${_pkgname}.AppImage --appimage-extract 1>>/dev/null 2>>/dev/null
    mv squashfs-root ${_shortname}
    cd ${_shortname}
    # Simplify life
    cp /usr/lib/libstdc++* $PWD
    cp /usr/lib/librsvg-2.so* $PWD
    patch -Np0 < $PWD/../cura.desktop.patch

}

package() {
    mkdir -p "${pkgdir}/opt/"
    cp -rf "${srcdir}/${_shortname}" "${pkgdir}/opt/"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -f "${srcdir}/cura5.sh" "${pkgdir}/usr/bin/${_shortname}"
    install -Dm 644 "${srcdir}/cura5/cura-icon.png" "${pkgdir}/usr/share/pixmaps/cura5-icon.png"
    install -Dm 644 "${srcdir}/cura5/cura.desktop" "${pkgdir}/usr/share/applications/cura5.desktop"
}
