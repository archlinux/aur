# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ayatale  <ayatale@qq.com>
pkgname=pplink-bin
_chsname='PP直连'
pkgver=14.2.0
_electronversion=31
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
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/download/linux/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('54580413805474aa481025834e6e86d565ddcd350331e967988feafd417bcfc5'
            '6acc470ced558f0572421e8d554fe5f99abc45be5f390f52d170a1e5d51440bb'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_chsname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\"\/opt\/${_chsname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_chsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_chsname}/resources/"{app.asar.unpacked,aria2,clipboard-event} "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}