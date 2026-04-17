# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clawd-on-desk-bin
_pkgname='Clawd on Desk'
pkgver=0.5.10
_electronversion=41
pkgrel=1
pkgdesc="A desktop pet that reacts to your Claude Code sessions in real-time — thinking, typing, juggling, sleeping, and more.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/rullerzhou-afk/clawd-on-desk"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/rullerzhou-afk/clawd-on-desk/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5f005528427338a9eb47a0e97c0196c8db9d66248cb6c2a42788c5699f862e70'
            'f9b5868027f67bd737f0b0ad0db2998b123a3e687de903181598996ba6f346a3'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cd "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi"
rm -rf {darwin_*,freebsd_*,linux_arm*,linux_ia32,linux_loong64,linux_riscv64d,musl_arm64,openbsd_*,win32_*}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/${_pkgname}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
