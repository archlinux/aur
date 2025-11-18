# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xresconv-gui-bin
pkgver=2.5.4
_electronversion=39
pkgrel=1
pkgdesc="批量转表工具的GUI版本,依赖electron.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/xresloader/xresconv-gui"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64.tar.xz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-armv7l.tar.xz")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.tar.xz")
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/xresloader/xresconv-gui/v${pkgver}/doc/logo.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/owent/xresconv-gui/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('3383900bc8b96fe4f9fcd7c851f925bc995aa3db9c054e5838c1e2703bf57898'
            'b6176ea061df625018a1f30e63f6e0f3a03c7f6ec23d26e0f6d920a819636729'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('e59a5d4544451567bd086470a137c5751624675488a4311f573798d1fa0ea63a')
sha256sums_armv7h=('a40a48a8a2ec2d3db67a6b7d7c2eabecf8199f115cfcefbc8a5671578d243231')
sha256sums_x86_64=('ce821542e9581d79069e3fef58bcc20fac55e7da3edc89dc45efe7971aae840a')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/${pkgname%-bin}-linux-"*/"${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
