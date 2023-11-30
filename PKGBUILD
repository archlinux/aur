# Maintainer: Nestor Cagnoli <nestor[DOT]cagnoli[at]gmail[DOT]com>
# Maintainer: Michael Gruz <michael.gruz@gmail.com>
pkgname=cura-5-beta-bin
_pkgname=cura-5-beta-bin
_shortname=cura5
pkgver=5.6.0
beta= #-beta.2
subbeta=
pkgrel=0
pkgdesc='Cura is an open source slicing application for 3D printers (include betaversion)'
arch=('x86_64')
url="https://ultimaker.com/software/ultimaker-cura"
license=('LGPL3')
depends=('xdg-desktop-portal' 'xdg-desktop-portal-gtk')
optdepends=('cura-5-plugin-octoprint: Cura plugin which enables printing directly to OctoPrint and monitoring the progress'
	'cura-5-plugin-octoprint-git: Cura plugin which enables printing directly to OctoPrint and monitoring the progress (latest git version)')
conflicts=('cura-5-bin' 'cura-5-modern-bin' 'cura-5-modern-beta-bin')
provides=('cura')
options=(!strip)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(
    "https://github.com/Ultimaker/Cura/releases/download/${pkgver}${beta}/Ultimaker-Cura-${pkgver}${beta}${subbeta}-linux-X64.AppImage"
    "https://raw.githubusercontent.com/Ultimaker/Cura/${pkgver}${beta}${subbeta}/LICENSE"
    "${_shortname}.sh"
    "cura.desktop.patch"
)

sha256sums=('107896a0da4b2873f3bfaad9aed36012bef2fff89571161e57f4da0a7f10a440'
            'f361bfaa2b63576ba829b3fb608f3f8baf5c25df51ebaba8c3554a7f3108e87d'
            '4b3de38326084d3ae1689596a6bd8673f2e2580d0be5d0710a0a31b4d8dde1f9'
            'ee7ace053a8d8b6ae0fa1be2cc7c9dca9a352d8b190a5e27098acbdc65f0eb8e')
   
prepare() {
    cd "${srcdir}"
    chmod +x ${srcdir}/Ultimaker-Cura-${pkgver}${beta}${subbeta}-linux-X64.AppImage
    ${srcdir}/Ultimaker-Cura-${pkgver}${beta}${subbeta}-linux-X64.AppImage --appimage-extract 1>>/dev/null 2>>/dev/null
    mv squashfs-root ${_shortname}
    cd ${_shortname}
    patch -Np0 < ${srcdir}/cura.desktop.patch

}

package() {
    install -d "${pkgdir}/opt/"
    cp -rf "${srcdir}/${_shortname}" "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/bin/"
    install -Dm 755 "${srcdir}/cura5.sh" "${pkgdir}/usr/bin/${_shortname}"
    install -Dm 755 "${srcdir}/cura5/cura-icon.png" "${pkgdir}/usr/share/pixmaps/cura5-icon.png"
    install -Dm 644 "${srcdir}/cura5/com.ultimaker.cura.desktop" "${pkgdir}/usr/share/applications/cura5.desktop"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
