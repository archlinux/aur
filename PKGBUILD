# Maintainer: SL_Pirate <isiraherath626@gmail.com>
# Contributor: Fabio Loli <fabio.loli@disroot.org>
# Contributor: Digimezzo <digimezzo@outlook.com>

_pkgname=Dopamine
__pkgname=dopamine
pkgname=dopamine-appimage-preview
__pkgver=3.0.0-preview
_prevver=38
_pkgver=${__pkgver}.${_prevver}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The audio player that keeps it simple"
arch=('x86_64')
url="https://digimezzo.github.io/site/"
license=('GPL3')
depends=(alsa-lib gtk3 nss)
provides=(dopamine)
conflicts=(dopamine)
options=(!strip)
source_x86_64=(https://github.com/digimezzo/dopamine/releases/download/v${__pkgver}.${_prevver}/Dopamine-${__pkgver}.${_prevver}.AppImage)
source=("dopamine.desktop")
sha512sums=('79ecf7f1bd5f9562289a945f4e07a17adce0e5de9ea005b3b791bc66c2ef3890cc144af4c9364464dd4c34b4789f03b0e56fc743b2ec9d26fab9dcb4f9c3a255')
sha512sums_x86_64=('2d16434ea3501243e2021b5b329f546f1570d25d3da6d6d45e1045c60f1f13b7e29e36e01150d675285a9272b1d0505178f5e47b7f711c18083d41c9704e4a61')

prepare() {
    chmod u+x      ${srcdir}/${_pkgname}-${_pkgver}.AppImage

    ${srcdir}/${_pkgname}-${_pkgver}.AppImage --appimage-extract
}

package() {
    find           ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
    find           ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/opt/${__pkgname}
    cp -r          ${srcdir}/squashfs-root/*                       ${pkgdir}/opt/${__pkgname}

    # remove broken or unused files and directories
    rm -r          ${pkgdir}/opt/${__pkgname}/usr/
    rm             ${pkgdir}/opt/${__pkgname}/AppRun
    rm             ${pkgdir}/opt/${__pkgname}/${__pkgname}.desktop
    rm             ${pkgdir}/opt/${__pkgname}/${__pkgname}.png

    find           ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/usr/share/icons
    cp -r          ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

    install -d     ${pkgdir}/usr/bin
    ln -s          ../../opt/${__pkgname}/${__pkgname}                ${pkgdir}/usr/bin/${__pkgname}

    install -Dm644 ${srcdir}/${__pkgname}.desktop                   ${pkgdir}/usr/share/applications/${__pkgname}.desktop
}
