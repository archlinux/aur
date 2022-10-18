# Maintainer: Nestor Cagnoli <nestor[DOT]cagnoli[at]gmail[DOT]com>
# Maintainer: Michael Gruz <michael.gruz@gmail.com>
pkgname=cura-5-bin
_pkgname=cura-5-bin
_shortname=cura5
pkgver=5.2.0
pkgrel=0
pkgdesc='Cura is an open source slicing application for 3D printers'
arch=('x86_64')
url="https://ultimaker.com/software/ultimaker-cura"
license=('LGPL3')
depends=('xdg-desktop-portal' 'xdg-desktop-portal-gtk')
optdepends=('cura-5-plugin-octoprint: Cura plugin which enables printing directly to OctoPrint and monitoring the progress'
	'cura-5-plugin-octoprint-git: Cura plugin which enables printing directly to OctoPrint and monitoring the progress (latest git version)')
conflicts=('cura-5-beta-bin')
provides=('cura')
options=(!strip)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(
    "https://github.com/Ultimaker/Cura/releases/download/${pkgver}/Ultimaker-Cura-${pkgver}-linux.zip"
    "https://raw.githubusercontent.com/Ultimaker/Cura/${pkgver}/LICENSE"
    "${_shortname}.sh"
    "cura.desktop.patch"
)

sha256sums=('33cd9bc322775967a34ef672fe5ba8dd2ba2b8eb867c6623e1bbbb3347972713'
            'f361bfaa2b63576ba829b3fb608f3f8baf5c25df51ebaba8c3554a7f3108e87d'
            'f7917a834849618f62147bf68e8cb1cb31157e724163325effd495ddd8be2494'
            '076fee81d82b5ae55e44d230adef79cf944f51befb76f30074195ac18dd7e16a')
   
prepare() {
    cd "${srcdir}"
    chmod +x ${srcdir}/Ultimaker-Cura-${pkgver}-linux.AppImage
    ${srcdir}/Ultimaker-Cura-${pkgver}-linux.AppImage --appimage-extract 1>>/dev/null 2>>/dev/null
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
    install -Dm 644 "${srcdir}/cura5/cura.desktop" "${pkgdir}/usr/share/applications/cura5.desktop"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
