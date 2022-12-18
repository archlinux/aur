# Maintainer: SL_Pirate <isiraherath626@gmail.com>
_pkgname=Dopamine
__pkgname=dopamine
pkgname=dopamine-appimage
pkgver=3.0.0
pkgrel=1
prev=true
prevver=18
pkgdesc="The audio player that keeps it simple"
arch=('x86_64')
url="https://digimezzo.github.io/site/"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname} ${__pkgname})
replaces=(${pkgname} ${__pkgname})
depends=()
makedepends=('coreutils')
backup=()
options=(!strip)
if [ "${prev}" = false ] ; then
    source=("${_pkgname}-${pkgver}.AppImage::https://github.com/digimezzo/${__pkgname}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver}.AppImage"
	    "${pkgname}.desktop")
else
    source=("${_pkgname}-${pkgver}.AppImage::https://github.com/digimezzo/${__pkgname}/releases/download/v${pkgver}-preview${prevver}/${_pkgname}-${pkgver}-preview.${prevver}.AppImage"
	   "${pkgname}.desktop")
fi

#sha512sums=('SKIP')
check_checksums(){
    echo "checksums skipped"
}

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
    rm             ${pkgdir}/opt/${pkgname}/${__pkgname}.desktop
    rm             ${pkgdir}/opt/${pkgname}/${__pkgname}.png

    find           ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/usr/share/icons
    cp -r          ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

    install -d     ${pkgdir}/usr/bin
    ln -s          ../../opt/${pkgname}/${__pkgname}                ${pkgdir}/usr/bin/${__pkgname}

    install -Dm644 ${srcdir}/${pkgname}.desktop                   ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
