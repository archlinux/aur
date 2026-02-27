# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=youku-bin
_appname=YouKu
_chsname='优酷'
pkgver=1.0.0
_electronversion=9
pkgrel=10
pkgdesc="Linux version of the Youku client APP, implemented on UOS using Electron technology.(Prebuilt version.Use system-wide electron)Linux版优酷客户端APP,基于Electron技术实现在kylin的APP客户端."
arch=('x86_64')
_kylinurl=""
license=("LicenseRef-custom")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://archive.kylinos.cn/kylin/partner/pool/${pkgname%-bin}-app_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('c28ade22d41fa6074fce7f2cb06f9db4dfba439698bbea37b0f5735d9ae30075'
            '27def8dfd0987086dd77bd167c731d8f50f5b485bae2dff71d44f7904ddc0d35')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_chsname}/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/kylin-${pkgname%-bin}-app/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/\"\/opt\/${_chsname}\/${_appname}\"/${pkgname%-bin}/g
        s/\/opt\/${_chsname}\/resources\/assets\/images\/app_icon32.png/${pkgname%-bin}/g
        s/Categories=Viedo;/Categories=AudioVideo;/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/resources"
	find "${srcdir}/opt/${_chsname}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources" {} +
    if find "${srcdir}/opt/${_chsname}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/opt/${_chsname}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/opt/${_chsname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/${_chsname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}