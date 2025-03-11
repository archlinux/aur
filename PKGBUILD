# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dida
pkgname="${_pkgname}365-bin"
pkgver=6.0.20
_electronversion=32
pkgrel=1
pkgdesc='Todo list, checklist and task manager app, Linux desktop application.(Prebuilt version.Use system-wide electron)'
arch=(
    'aarch64'
    'x86_64'
)
url='https://www.dida365.com'
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${_pkgname}"
    "${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
)
source=(
    "LICENSE-opensource.html::${url}/license/web"
    "LICENSE-custom.html::${url}/about/tos"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://cdn.dida365.cn/download/linux/linux_rpm_arm64/${_pkgname}-${pkgver}-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://cdn.dida365.cn/download/linux/linux_rpm_x64/${_pkgname}-${pkgver}-x86_64.rpm")
sha256sums=('750bd0b73007bbd33c39ecb022ffcb8a39f5366c13f36de5381a4d857bdc7be8'
            '515ffcfdb2d684ec06cf7705146b1eda7ad98d1ae940b1b9798604e2943e0c87'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('1092389476ba3e7315f1ccb9d4e863467e1f3913977d23ab72d66ba11595f3f5')
sha256sums_x86_64=('d24f0714a777ba04e78e06edf7b1c4005114e8025de112445322d843422a7c63')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}