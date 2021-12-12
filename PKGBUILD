# Maintainer: Digimezzo <raphael@digimezzo.com>
_pkgname=Vitomu
pkgname=vitomu
pkgver=2.1.0
pkgrel=1
pkgdesc="Easy to use video to audio converter"
arch=('x86_64')
url="https://www.digimezzo.com"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
depends=()
makedepends=('coreutils')
backup=()
options=(!strip)
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/digimezzo/${pkgname}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver}.AppImage"
	"${pkgname}.desktop")
sha256sums=('180ec93b9b8a8b6dab960db899dfa551bbc6b33fba011e18133c7700eacad51b'
		'1330c2e18e4ffce1b7495f130441428a8e04bd04e030bd974993ac9f3fd3eddc')

prepare() {
    chmod u+x      ${srcdir}/${_pkgname}-${pkgver}.AppImage

    ${srcdir}/${_pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
    find           ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
    find           ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/opt/${pkgname}
    cp -r          ${srcdir}/squashfs-root/*                       ${pkgdir}/opt/${pkgname}

    # remove broken or unused files and directories
    rm -r          ${pkgdir}/opt/${pkgname}/usr/
    rm             ${pkgdir}/opt/${pkgname}/AppRun
    rm             ${pkgdir}/opt/${pkgname}/${pkgname}.desktop
    rm             ${pkgdir}/opt/${pkgname}/${pkgname}.png

    find           ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/usr/share/icons
    cp -r          ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

    install -d     ${pkgdir}/usr/bin
    ln -s          ../../opt/${pkgname}/${pkgname}                ${pkgdir}/usr/bin/${pkgname}

    install -Dm644 ${srcdir}/${pkgname}.desktop                   ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
