# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=catcat-dm-react
_pkgname="CatCatDM React"
pkgver=1.9.6
_electronversion=23
pkgrel=1
pkgdesc="catcat弹幕姬.哔哩哔哩直播弹幕姬： 查看直播间弹幕。"
arch=('x86_64')
url="https://github.com/kokolokksk/catcat-dm-react"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'libxext'
    'gtk3'
    'mesa'
    'alsa-lib'
    'cairo'
    'libxcb'
    'libx11'
    'libdrm'
    'libxdamage'
    'at-spi2-core'
    'nspr'
    'nss'
    'hicolor-icon-theme'
    'libxrandr'
    'expat'
    'libcups'
    'pango'
    'libxcomposite'
    'libxkbcommon'
    'libxfixes'
)
makedepends=(
    'npm>=7'
    'nodejs>=18'
    'gendesk'
    'yarn'
    'git'
    'make'
    'gcc'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('SKIP')
build() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    sed "s|-p always|-p never|g" -i package.json
    npm install
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r  "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}