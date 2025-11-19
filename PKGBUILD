# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ayatale  <ayatale@qq.com>
pkgname=pplink-bin
_zhsname='PP直连'
pkgver=15.2.1
_electronversion=36
pkgrel=1
pkgdesc="Dedicated to direct interconnection across devices, networks, and platforms.(Prebuilt version.Use system-wide electron)帮助电脑、手机、平板等设备建立点到点的安全直连"
arch=('x86_64')
url="https://www.ppzhilian.com"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python>=3'
    'nodejs'
    'aria2'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/download/linux/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('3874ffa83b86ca289eeab1c96a8ab752a70935d52655ea61add16f1644551e82'
            '6acc470ced558f0572421e8d554fe5f99abc45be5f390f52d170a1e5d51440bb'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_zhsname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_zhsname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\"\/opt\/${_zhsname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/usr/bin/aria2c" "${srcdir}/opt/${_zhsname}/resources/aria2/aria2c"
    rm -rf \
        "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/@hurdlegroup/robotjs/prebuilds/"{darwin-*,win32-*} \
        "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/fswin/"{arm64,ia32}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_zhsname}/resources/"{app.asar.unpacked,aria2,clipboard-event} "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
