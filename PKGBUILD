# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imfile-bin
_pkgname=imFile
pkgver=1.2.0
_electronversion=41
pkgrel=1
pkgdesc="A full-featured download manager.Forked from motrix.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://imfile.io/"
_ghurl="https://github.com/imfile-io/imfile-desktop"
license=('MIT')
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-electron"
    'motrix'
)
provides=(
    'motrix'
    "${pkgname%-bin}=${pkgver}"
)
depends=(
    "electron${_electronversion}"
    'aria2'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/imfile-io/imfile-desktop/${_pkgname}-${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${_pkgname}-${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/${_pkgname}-${pkgver}/${pkgname%-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${_pkgname}-${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('f60775e705e2c7418665ac2c7f386d28cc2927df98a440ced1703a7ed3ca86b7'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('d126f83fcae2f7e455c5709ca68303bf8d4c3b8d61cc14126111a1323dc7d67e')
sha256sums_armv7h=('325bd201d8134664fd78521bac98c7eafa7fd371088b9b349704d2fc6337066f')
sha256sums_x86_64=('9f6b821715523564d52e64d7d4e6801861d6d333de95f4c497d7f9acbe13b730')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/usr/bin/aria2c" "${srcdir}/opt/${_pkgname}/resources/engine/aria2c"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}/opt/${_pkgname}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/opt/${_pkgname}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/opt/${_pkgname}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
}
