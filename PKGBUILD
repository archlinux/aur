# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle
_pkgname=Monokle
pkgver=2.4.4
pkgrel=1
pkgdesc="Lets you create, analyze, and deploy YAML manifests with a visual UI, and provides policy validation and cluster management."
arch=('x86_64')
url="https://monokle.io/"
_ghurl="https://github.com/kubeshop/monokle"
license=('MIT')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
depends=(
    'at-spi2-core'
    'alsa-lib'
    'expat'
    'libxcomposite'
    'libdrm'
    'libxkbcommon'
    'libxfixes'
    'libxdamage'
    'gtk3'
    'nspr'
    'mesa'
    'libxrandr'
    'cairo'
    'nss'
    'libxext'
    'python'
    'libx11'
    'pango'
    'libcups'
    'libxcb'
)
makedepends=(
    'npm'
    'nodejs>=20'
    'jq'
    'gendesk'
    'git'
)
source=(
    "${pkgname}::git+${_ghurl}#tags=v${pkgver}"
)
sha256sums=('SKIP')
build() {
    gendesk -q -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed -e "291,297d" -e "271,277d" -e "258,264d" -e '/arm64/d' -e 's|"x64",|"x64"|g' -i package.json
    npm ci
    npm run electron:build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32 48 64 256;do
        install -Dm644 "${srcdir}/${pkgname}/build/large-icon-${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}