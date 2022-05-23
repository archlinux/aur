# Maintainer: Stephan We <me [at] stephanwe [DOT] de>
# Credits to: Igor Moura <imp2@cin.ufpe.br>
# This pkgbuild is based on his "freecad-appimage-git"

pkgname=cura-appimage-bin
_pkgname=Ultimaker-Cura
_shortname=cura
pkgver=5.0.0
pkgrel=1
pkgdesc='Ultimakers 3D printer / slicing GUI built on top of the Uranium framework'
arch=('x86_64')
url="https://ultimaker.com/software/ultimaker-cura"
license=('LGPL3')
depends=('fuse2')
provides=('cura')
conflicts=('cura' 'cura-appimage-git' 'cura-appimage-bin')
options=(!strip)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
noextract=('${_pkgname}-${pkgver}.AppImage')
source=(
    "${_pkgname}-${pkgver}.AppImage::https://github.com/Ultimaker/Cura/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.AppImage"
    "cura.sh"
    "cura.desktop.patch"
)

sha256sums=(
    "ec00f8e42a46fd24cd71e098fa713a08be4e2bcc6df17d5d02938bc6ea315754"
    "6430e6359ff98b7c6a209181c389cfc606d1e84628793a4eb772c5e2f0d0a23f"
    "6c1b54af7077ca101cca099f40d9627d6d69e9b11a5a6ae0667e118d764dc903"
)
   
prepare() {
    cd "${srcdir}"
    chmod +x $PWD/${_pkgname}-${pkgver}.AppImage
    $PWD/${_pkgname}-${pkgver}.AppImage --appimage-extract cura-icon.png
    $PWD/${_pkgname}-${pkgver}.AppImage --appimage-extract cura.desktop
    patch -Np0 < $PWD/cura.desktop.patch
    sed -i "s/VERSION_PLACEHOLDER/${pkgver}/g" cura.sh
}

package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}-${pkgver}.AppImage"
    install -Dm 755 "${srcdir}/cura.sh" "${pkgdir}/usr/bin/${_shortname}"
    install -Dm 644 "${srcdir}/squashfs-root/cura-icon.png" "${pkgdir}/usr/share/pixmaps/cura-icon.png"
    install -Dm 644 "${srcdir}/squashfs-root/cura.desktop" "${pkgdir}/usr/share/applications/cura.desktop"
}
