# Maintainer: Nestor Cagnoli <nestor[DOT]cagnoli[at]gmail[DOT]com>
# Maintainer: Michael Gruz <michael.gruz@gmail.com>
pkgname=cura-5-bin
_pkgname=cura-5-bin
_shortname=cura5
pkgver=5.1.0
pkgrel=4
pkgdesc='Uncompressed version of Ultimaker Cura 5.1'
arch=('x86_64')
url="https://ultimaker.com/software/ultimaker-cura"
license=('LGPL3')
depends=('xdg-desktop-portal' 'xdg-desktop-portal-gtk')
provides=('cura')
options=(!strip)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(
    "https://github.com/Ultimaker/Cura/releases/download/${pkgver}/Ultimaker-Cura-${pkgver}-linux.AppImage"
    "${_shortname}.sh"
    "cura.desktop.patch"
)

sha256sums=('eab92e31c12c1b101fbaf2664df00bed182528e282874e4f379c87b29692ac76'
            '55cf596db74ab369e33f860d581e9e27b72a1d4688de37868c038ad5328fb09a'
            '4db683cf5424c97553ba3b6ab834b838ffec731441b240e6451e4ffc12a66976')
   
prepare() {
    cd "${srcdir}"
    chmod +x ${srcdir}/Ultimaker-Cura-${pkgver}-linux.AppImage
    ${srcdir}/Ultimaker-Cura-${pkgver}-linux.AppImage --appimage-extract 1>>/dev/null 2>>/dev/null
    mv squashfs-root ${_shortname}
    cd ${_shortname}
    # Simplify life
    cp /usr/lib/libstdc++* ${srcdir}
    cp /usr/lib/librsvg-2.so* ${srcdir}
    patch -Np0 < ${srcdir}/cura.desktop.patch

}

package() {
    mkdir -p "${pkgdir}/opt/"
    cp -rf "${srcdir}/${_shortname}" "${pkgdir}/opt/"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -f "${srcdir}/cura5.sh" "${pkgdir}/usr/bin/${_shortname}"
    install -Dm 644 "${srcdir}/cura5/cura-icon.png" "${pkgdir}/usr/share/pixmaps/cura5-icon.png"
    install -Dm 644 "${srcdir}/cura5/cura.desktop" "${pkgdir}/usr/share/applications/cura5.desktop"
}
