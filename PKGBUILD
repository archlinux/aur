# Maintainer: Digimezzo <digimezzo@outlook.com>
_productname=Dopamine
_productnamelower=dopamine
pkgname=dopamine-official
pkgver=3.0.10
pkgrel=1
pkgdesc="The audio player that keeps it simple"
arch=('x86_64')
url="https://digimezzo.github.io/site/"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
depends=()
makedepends=('coreutils')
backup=()
options=(!strip)
source=("${_productname}-${pkgver}.AppImage::https://github.com/digimezzo/${_productnamelower}/releases/download/v${pkgver//_/-}/${_productname}-${pkgver}.AppImage"
	"${_productname}.desktop")
sha256sums=('6525789b10ca64a3a24f54454ff20ac4799502837f8cff734d78b57a106c6fa4'
		'e0ac0b0c4deaaa288eb712492661fc0d22614277f2d3fd6953d45a23c9a4890d')

prepare() {
    chmod u+x      ${srcdir}/${_productname}-${pkgver}.AppImage

    ${srcdir}/${_productname}-${pkgver}.AppImage --appimage-extract
}

package() {
    find           ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
    find           ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/opt/${_productname}
    cp -r          ${srcdir}/squashfs-root/*                       ${pkgdir}/opt/${_productname}

    # remove broken or unused files and directories
    rm -rf         ${pkgdir}/opt/${_productnamelower}/usr/
    rm -f          ${pkgdir}/opt/${_productnamelower}/AppRun
    rm -f          ${pkgdir}/opt/${_productnamelower}/${_productnamelower}.desktop
    rm -f          ${pkgdir}/opt/${_productnamelower}/${_productnamelower}.png
    rm -rf         ${pkgdir}/opt/${_productname}/usr/
    rm -f          ${pkgdir}/opt/${_productname}/AppRun
    rm -f          ${pkgdir}/opt/${_productname}/${_productname}.desktop
    rm -f          ${pkgdir}/opt/${_productname}/${_productname}.png

    find           ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/usr/share/icons
    cp -r          ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

    install -d     ${pkgdir}/usr/bin
    ln -s          ../../opt/${_productname}/${_productnamelower}                ${pkgdir}/usr/bin/${_productnamelower}

    install -Dm644 ${srcdir}/${_productname}.desktop                   ${pkgdir}/usr/share/applications/${_productname}.desktop
}

