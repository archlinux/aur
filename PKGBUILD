# Maintainer: Ice Year
_appname=feishin
pkgname=iipython-feishin-electron-bin
_pkgname=feishin
pkgver=26.01.22_1.0_2
_tag=26.01.22-1.0-2
_upstream_tag=26.01.22-1.0
_assetver=26.01.22
_electronversion=39
pkgrel=1
pkgdesc="A modern self-hosted music player (iiPythonx build, prebuilt, system-wide electron, lite rolldown-vite build)"
arch=('x86_64')
url="https://github.com/iceyear/iipython-feishin-electron-bin"
license=('GPL-3.0-only')
provides=("${_appname}=${pkgver}")
conflicts=(
    "${_appname}"
    "${_appname}-bin"
    "${_appname}-electron-bin"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=("${pkgname%-bin}.sh")
source_x86_64=(
    "${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${_tag}/${_appname}-${_assetver}-linux-amd64.deb"
)
sha256sums=('4497d4c2cfb24ca0665cbeabf377a6bc850a8cfd6dd17469b0dc937a9ed6bf65')
sha256sums_x86_64=('d20524e956feb1e1cbe1d0714081fcfbec3d0ad86be92f709c3823248f48450a')

_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/Feishin/feishin" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}

prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    ar x "${srcdir}/${pkgname%-bin}-${pkgver}-x86_64.deb"
    _data_archive="$(ls data.tar.* 2>/dev/null | head -n1)"
    if [[ -z "${_data_archive}" ]]; then
        echo "Missing data.tar.* in deb archive"
        return 1
    fi
    bsdtar -xf "${_data_archive}"
    _get_electron_version
    sed -i -e "
        s|Exec=.*|Exec=${pkgname%-bin} %U|g
        s|Icon=.*|Icon=${pkgname%-bin}|g
    " "${srcdir}/usr/share/applications/feishin.desktop"
    asar e "${srcdir}/opt/Feishin/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/out" -type f -exec sed -i "s/process.resourcesPath/'\/usr\/lib\/${pkgname%-bin}'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    if [[ -d "${srcdir}/opt/Feishin/resources/assets" ]]; then
        find "${srcdir}/opt/Feishin/resources/assets" -type d -exec chmod 755 {} +
    fi
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    if [[ -d "${srcdir}/opt/Feishin/resources/assets" ]]; then
        cp -Pr --no-preserve=ownership "${srcdir}/opt/Feishin/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    fi
    if [[ -d "${srcdir}/opt/Feishin/lib" ]]; then
        install -Dm644 "${srcdir}/opt/Feishin/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    fi
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}"; do
        if [[ -f "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/feishin.png" ]]; then
            install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/feishin.png" \
                "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
        fi
    done
    install -Dm644 "${srcdir}/usr/share/applications/feishin.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
