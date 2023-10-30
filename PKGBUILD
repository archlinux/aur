# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle
_pkgname=Monokle
pkgver=2.4.3
pkgrel=1
pkgdesc="Lets you create, analyze, and deploy YAML manifests with a visual UI, and provides policy validation and cluster management."
arch=('x86_64')
url="https://monokle.io/"
_githuburl="https://github.com/kubeshop/monokle"
license=('MIT')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
depends=(
    'zlib'
    'gcc-libs'
    'at-spi2-core'
    'alsa-lib'
    'expat'
    'libxcomposite'
    'libdrm'
    'libxkbcommon'
    'libxfixes'
    'libxdamage'
    'gtk3'
    'glib2'
    'nspr'
    'mesa'
    'libxrandr'
    'cairo'
    'nss'
    'dbus'
    'libxext'
    'python'
    'libx11'
    'pango'
    'sh'
    'libcups'
    'libxcb'
)
makedepends=(
    'npm'
    'nodejs>=20'
    'jq'
    'gendesk'
)
source=("${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('87649dab2638040d7edccc74f44dc1507cec7ec89f49eb2630332cdaca1441e9')
build() {
    gendesk -q -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    1cd "${srcdir}/${pkgname}-${pkgver}"
    if [ -d .git ];then
        rmdir .git && mkdir .git
    else
        mkdir .git
    fi
    sed -e "291,297d" -e "271,277d" -e "258,264d" -e '/arm64/d' -e 's|"x64",|"x64"|g' -i package.json
    npm ci
    npm run electron:build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32 48 64 256;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/large-icon-${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
