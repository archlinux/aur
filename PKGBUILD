# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dialogcraft
_pkgname=DialogCraft
pkgver=1.0.7
_electronversion=25
pkgrel=1
pkgdesc="Desktop client for OpenAI GPT API."
arch=('any')
url="https://github.com/Hayden2018/dialogcraft"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'libxfixes'
    'cairo'
    'nspr'
    'libdrm'
    'mesa'
    'libxrandr'
    'libxext'
    'libxcomposite'
    'libcups'
    'gtk3'
    'pango'
    'libxdamage'
    'alsa-lib'
    'expat'
    'nss'
    'at-spi2-core'
    'libx11'
    'libxkbcommon'
    'libxcb'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
)
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
    nvm use 16
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    export npm_config_build_from_source=true
    export npm_config_cache="$srcdir/npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION=$(electron${_electronversion} -v | sed 's/v//g')
    export ELECTRONVERSION="${_electronversion}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci
    sed -e '26,31d' -e '8,19d' -i forge.config.js
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/bin,opt/"${pkgname}"}
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-"*/* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}