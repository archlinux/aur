# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dida
pkgname="${_pkgname}365-bin"
pkgver=6.0.30
_electronversion=21
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
sha256sums=('9c12c6e407c89e696fb6278dba78ea6f26e70d285a2e944be75199584402581e'
            'b4e8b82341c5bf6fe50649b84658fcae8110f70dcd40164352d4154a0236b776'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('196a3923a4738f2d3a3dfd4e7741fc9de6d59e9ca5103bc9caa42aa1c4c0dba2')
sha256sums_x86_64=('c660425102cdec735441b423853ec3c4df4a42c5aac3f7653d549e9010b91170')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
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