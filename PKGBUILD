# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thoughts-bin
_zhsname='思绪思维导图'
_debname=io.github.wanglin2.mind-map
pkgver=0.18.2
_electronversion=23
pkgrel=1
pkgdesc="A relatively powerful web mind map.(Prebuilt version.Use system-wide electron)一个还算强大的Web思维导图."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://wanglin2.github.io/mind-map/#/index"
_ghurl="https://github.com/wanglin2/mind-map"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'squashfs-tools'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/wanglin2/mind-map/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('8a19b651678a6a644640524d984ed89d0b9a78c662545715218a05130c7329c7'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('9ed12f7d2677d3416997fd6793a096f61198f28b2e094fe7fc868bda02cdd73e')
sha256sums_armv7h=('46549c64779a146ec9a5189b8829110c0540b3b1c4e896d92e7ff34bda55a7a4')
sha256sums_x86_64=('bfb421422dc4121eb69349666174ff170710080ca223e023cfcfa94330d6bbdc')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_zhsname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
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
    sed -i -e "
        s/\"\/opt\/${_zhsname}\/${pkgname%-bin}\"/${pkgname%-bin}/g
        s/Utilities/Office/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	find "${srcdir}/opt/${_zhsname}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/opt/${_zhsname}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/opt/${_zhsname}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    _icon_sizes=(32x32 128x128 256x256)
    for _icon in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icon}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icon}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
