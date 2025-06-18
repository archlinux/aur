# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zhiximind-desktop-bin
_debname=com.zhixi.desktop
pkgver=3.3.12
_electronversion=22
pkgrel=1
pkgdesc="A mind mapping and mind mapping software present on all major platforms.(Prebuilt version.Use system-wide electron)知犀思维导图官方版"
arch=('x86_64')
url="https://www.zhixi.com"
license=('LicenseRef-Custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://www.zhixi.com/download/linux?channel=21C8B557"
    "LICENSE-${pkgver}.html::${url}/user-agreement"
    "${pkgname%-bin}.sh"
)
sha256sums=('a797b9dff210945a8371cd2b7fb1f2772c5579425d37c8ef35e6da026b630187'
            'fdfc317944b0210c65353d25e47f87bcadfe841270c7ffcb237212148b1ddb26'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${_debname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/opt\/${_debname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_debname}/resources/"*.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_debname}/resources/"{app.asar.unpacked,config.json} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}