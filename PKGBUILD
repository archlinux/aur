# Maintainer: Klaus Ferreira <klauseverwalkingdev at yandex dot com>

_pkgname="deemix-gui"
_carch="x86_64"
_originalappimagefilename="linux-${_carch}-latest.AppImage"
_appimage="${_pkgname}.AppImage"

pkgname="${_pkgname}-appimage"
pkgver=20220717
pkgrel=1
pkgdesc="A gui electron app for the deemix lib."
arch=("${_carch}")
url="https://deemix.app/gui"
license=("GPL3")
depends=("alsa-lib" "dbus-glib" "gtk3" "libdbusmenu-gtk2" "libindicator-gtk2" "nss")
source=(
    "https://download.deemix.app/gui/${_originalappimagefilename}"
)
sha256sums=('ad13a7b66e5d8f578a418ac78f58aae4c3896d9b4e2ea0cbd2e0a4b8474a69d7')

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
