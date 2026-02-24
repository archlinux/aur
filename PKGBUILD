# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: bgt <choo-yy at qq dot com>
# Contributor: glatavento <glatavento  at outlook dot com>
# Contributor: sukanka <su975853527 at gmail dot com>
_pkgname=siyuan
pkgname="${_pkgname}-note-bin"
_appname=SiYuan
pkgver=3.5.8
_electronversion=39
pkgrel=1
pkgdesc="A local-first personal knowledge management system.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://b3log.org/siyuan/"
_ghurl="https://github.com/siyuan-note/siyuan"
license=('AGPL-3.0-only')
provides=("${_pkgname}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.deb")
sha256sums=('2ae9a625561e5d5c8ab724331d04cc4230d27ad703c931a7f5de07a0b108e66e')
sha256sums_aarch64=('a55c730c8b64ae4182a68feb7d70f08c0595e09e513e74aa4e4e0e7634b95b83')
sha256sums_x86_64=('1c50a4f5a17b28598816f55a1008a0f74b2562adf9a47898092251cb6d41d442')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_appname}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_appname}-Electron/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_appname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Utility/Office/g
        3i\Name[zh_CN]=思源笔记
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    find "${srcdir}/opt/${_appname}/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}/opt/${_appname}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/opt/${_appname}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/opt/${_appname}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}