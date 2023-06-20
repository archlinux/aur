# Maintainer: Nestor Cagnoli <nestor[DOT]cagnoli[at]gmail[DOT]com>
# Maintainer: Michael Gruz <michael.gruz@gmail.com>
pkgname=cura-5-modern-bin
_pkgname=cura-5-modern-bin
_shortname=cura5
pkgver=5.3.1
pkgrel=2
pkgdesc='Cura is an open source slicing application for 3D printers (Modern AppImage)'
arch=('x86_64')
url="https://ultimaker.com/software/ultimaker-cura"
license=('LGPL3')
depends=('xdg-desktop-portal' 'xdg-desktop-portal-gtk')
optdepends=('cura-5-plugin-octoprint: Cura plugin which enables printing directly to OctoPrint and monitoring the progress'
	'cura-5-plugin-octoprint-git: Cura plugin which enables printing directly to OctoPrint and monitoring the progress (latest git version)')
conflicts=('cura-5-bin' 'cura-5-beta-bin' 'cura-5-modern-beta-bin')
provides=('cura')
options=(!strip)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(
    "https://github.com/Ultimaker/Cura/releases/download/${pkgver}/Ultimaker-Cura-${pkgver}-linux-modern.AppImage"
    "https://raw.githubusercontent.com/Ultimaker/Cura/${pkgver}/LICENSE"
    "${_shortname}.sh"
    "cura.desktop.patch"
)

sha256sums=('7cfa276536d79307a20387231a31dcd3f95d98c9ab46fa0e34c96856b3553c0b'
            'f361bfaa2b63576ba829b3fb608f3f8baf5c25df51ebaba8c3554a7f3108e87d'
            'abd972fa450409625bd54122de8a3cbb5848054afe4fc2e70e99444233037e12'
            '82a420ff977222150fb25e6b3dafe6ab5694a958666330297e10a1b02a2a69b9')
   
prepare() {
    cd "${srcdir}"
    chmod +x ${srcdir}/Ultimaker-Cura-${pkgver}-linux-modern.AppImage
    ${srcdir}/Ultimaker-Cura-${pkgver}-linux-modern.AppImage --appimage-extract 1>>/dev/null 2>>/dev/null
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
