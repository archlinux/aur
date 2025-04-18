# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=masayloblockly-bin
_pkgname=MasayloBlockly
pkgver=2.0.0
_electronversion=33
pkgrel=1
pkgdesc="A humble Blockly based app to control an Arduino based robot as the Masaylo robot using jpfontaine's work with the marvelous Blocklino.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/agomezgar/masayloBlockly"
license=(
    'LGPL-2.1-only'
    'CC0-1.0'
)
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python-pillow'
    'python-lxml'
    'python-pip'
    'python-wheel'
    'python-colorama'
    'python-setuptools'
    'python-yaml'
    'python-pyopenssl'
    'python-brotli'
    'python-click'
    'python-cryptography'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/agomezgar/masayloblockly/v2.1.0/LICENSE"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/agomezgar/masayloblockly/v2.1.0/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('dbbe6016b0c23e8dd651c274d1a8125c389fb35e918e70ca734be0d6cd650a0f'
            '20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331'
            '33c4de6d76721945c9346b3b1024fe56f2fbb6bebbb0e761656232520a6defa6'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}