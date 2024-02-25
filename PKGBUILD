# Maintainer: awhb

_pkgname="deemix-gui"
_carchbase="x86"
_carchbit="64"
_originalappimagefilename="linux-x${_carchbit}-latest.AppImage"
_appimage="${_pkgname}.AppImage"

pkgname="${_pkgname}-appimage"
pkgver=20221215
pkgrel=6
pkgdesc="A gui electron app for the deemix lib"
arch=("${_carchbase}_${_carchbit}")
url="https://gitlab.com/RemixDev/deemix-gui"
license=("GPL3")
depends=("alsa-lib" "dbus-glib" "gtk3" "libdbusmenu-gtk2" "libindicator-gtk2" "nss")
source=("https://archive.org/download/deemix/gui/${_originalappimagefilename}")
sha256sums=('7b69de7a6b00cc69e20695c83d86ca9392d01e860bbc58f9ffc42ccc27284d83')
md5sums=('1b51eeaa29ecea32af2c08f262fd576b')

prepare() {
    mv ./${_originalappimagefilename} ./${_appimage}
    chmod u+x ./${_appimage}
    ./${_appimage} --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/lib"
    install -dm755 "${pkgdir}/usr/share"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/licenses"
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}"

    cp -a "../LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    cp -a "${srcdir}/squashfs-root" "${pkgdir}/usr/lib/${_pkgname}"
    find "${pkgdir}/usr/lib/${_pkgname}" -type d -exec chmod 755 "{}" \;

    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"

    sed -i -e "s/AppRun/deemix-gui/" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}.desktop"
    ln -s "/usr/lib/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
