# Maintainer: Stephan We <me [at] stephanwe [DOT] de>
# Credits to: Igor Moura <imp2@cin.ufpe.br>
# This pkgbuild is based on his "freecad-appimage-git"

pkgname=cura-appimage-bin
_pkgname=Ultimaker_Cura
_shortname=cura
pkgver=4.8.0
pkgrel=1
pkgdesc='Ultimakers 3D printer / slicing GUI built on top of the Uranium framework'
arch=('x86_64')
url="https://ultimaker.com/software/ultimaker-cura"
license=('LGPL3')
depends=('fuse2')
provides=('cura')
conflicts=('cura' 'cura-appimage-git')
options=(!strip)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
noextract=('${_pkgname}-${pkgver}.AppImage')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/Ultimaker/Cura/releases/download/4.8/${_pkgname}-${pkgver}.AppImage"
    "cura.sh"
    "cura.desktop.patch")

sha256sums=("1628a9708763b41a271b4e5a6dbceeb54989aadf6f8b685d049498b0c89da5ce"
    "9b9c7215655ff4469c3c59679aa7f57cbd1f5153e628fe2375866ac94d8ffd96"
    "c950da916ead034a4ce871c25ca20c5d3f0fc5d65492a082dcaf7897af357aa3"
    )
   
prepare() {
    cd "${srcdir}"
    chmod +x $PWD/${_pkgname}-${pkgver}.AppImage
    $PWD/${_pkgname}-${pkgver}.AppImage --appimage-extract cura.desktop
    $PWD/${_pkgname}-${pkgver}.AppImage --appimage-extract cura-icon.png
    $PWD/${_pkgname}-${pkgver}.AppImage --appimage-extract usr/share
    patch -Np0 < $PWD/cura.desktop.patch
}


package() {
    install -Dm 755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}-${pkgver}.AppImage"
    install -Dm 755 "${srcdir}/cura.sh" "${pkgdir}/usr/bin/${_shortname}"
    install -dm 755 "${pkgdir}/usr/share"
    install -Dm 644 "${srcdir}/squashfs-root/cura-icon.png" "${pkgdir}/usr/share/pixmaps/cura-icon.png"
    install -Dm 644 "${srcdir}/squashfs-root/cura.desktop" "${pkgdir}/usr/share/applications/cura.desktop"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/" "${pkgdir}/usr"
}
