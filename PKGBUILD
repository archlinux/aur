# Maintainer: Klaus Ferreira <klauseverwalkingdev at yandex dot com>

_pkgname="deemix-gui"
_carchbase="x86"
_carchbit="64"
_originalappimagefilename="linux-x${_carchbit}-latest.AppImage"
_appimage="${_pkgname}.AppImage"

pkgname="${_pkgname}-appimage"
pkgver=20220819
pkgrel=1
pkgdesc="A gui electron app for the deemix lib."
arch=("${_carchbase}_${_carchbit}")
url="https://deemix.app/gui"
license=("GPL3")
depends=("alsa-lib" "dbus-glib" "gtk3" "libdbusmenu-gtk2" "libindicator-gtk2" "nss")
source=(
    "https://download.deemix.app/gui/${_originalappimagefilename}"
)
sha256sums=('a6812f10861de455d1c1e00620ae40ccf8c1598de9f1eaed8813db115d2cbfe7')

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
