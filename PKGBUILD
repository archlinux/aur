# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname="fireblocks recovery utility"
pkgname="${_pkgname// /-}-bin"
_appname='Fireblocks Recovery Utility'
pkgver=1.7.0
_fileversion="${pkgver}"
_electronversion=21
pkgrel=1
pkgdesc="Recover Fireblocks assets and keys in a disaster, verify a Recovery Kit, or generate keys to set up a new Recovery Kit.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://www.fireblocks.com/"
_ghurl="https://github.com/fireblocks/recovery"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/Recovery.Utility.Ubuntu.${CARCH//_/-}.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('29396b5972341306cb7f4ef08a35151080d87a758a5d36ac33e92bdd03d26152'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/squashfs-root/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/apps/recovery-utility/dist/${_appname}-${_fileversion}.AppImage" ];then
        chmod +x "${srcdir}/${_appname}-${_fileversion}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/apps/recovery-utility/dist/${_appname}-${_fileversion}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    find "${srcdir}/squashfs-root" -type d -perm 700 -exec chmod 755 {} +
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	find "${srcdir}/squashfs-root/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/squashfs-root/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/squashfs-root/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
