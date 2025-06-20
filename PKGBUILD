# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mterm-bin
pkgver=1.0.34_beta
_electronversion=28
pkgrel=1
pkgdesc="An electron terminal with a big vision. Written with react, typescript, vite and more.(Prebuilt version. use system-wide electron)"
arch=('x86_64')
url="https://mterm.io/"
_ghurl="https://github.com/mterm-io/mterm"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    '7zip'
    'python'
    'nodejs'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('7fc5e0d5d9c6063c26e794dcdb386df8d3aa952014053a81853696508fac38e6'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}/opt/${pkgname%-bin}/node_modules" -type d \( -name "*arm*" -o -name "mac" -o -name "win" -o -name "ia32" \) -exec rm -rf {} +;
    ln -sf "/usr/bin/7za" "${srcdir}/opt/${pkgname%-bin}/node_modules/7zip-bin/linux/x64/7za"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/node_modules/opt/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/node_modules" "${pkgdir}/usr/lib/${pkgname%-bin}/node_modules/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}