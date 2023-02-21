# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flawesome-appimage
_pkgname=Flawesome
pkgver=0.2.3
pkgrel=1
epoch=
pkgdesc="Flawesome is a modern productivity tool that will help you organise your day-today work and thoughts."
arch=("x86_64")
url="https://github.com/ashishBharadwaj/flawesome"
license=('GPL3')
depends=('gtk2' 'dbus-glib' 'libdbusmenu-glib' 'libxss' 'libxtst' 'libnotify')
options=(!strip)
optdepends=()
provides=(ashishBharadwaj)
conflicts=('flawesome-bin')
install=
_install_path="/opt/appimages"
source=(
    "${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    )
sha256sums=('c673740a1399440fd17c75c35ab5873281e552bee2313e06d16eccdc98e7fe46')
   
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Categories=Productivity;/Categories=Utility;/g' -i "${srcdir}/squashfs-root/flawesome.desktop"
    echo "Exec=/opt/appimages/Flawesome.AppImage" >> "${srcdir}/squashfs-root/flawesome.desktop"
    find "${srcdir}/squashfs-root/" -type d -exec chmod 755 {} \;
    rm -r ${srcdir}/squashfs-root/usr/lib/{libXss.so.1,libXtst.so.6,libnotify.so.4}
}
   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    cp -r "${srcdir}/squashfs-root/usr" "${pkgdir}/"
    install -Dm644 "${srcdir}/squashfs-root/flawesome.desktop" "${pkgdir}/usr/share/applications/flawesome.desktop"
}
