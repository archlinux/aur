# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=commas
_pkgname=Commas
pkgver=0.29.2
_electronversion=26
_nodever=18
pkgrel=2
pkgdesc="A hackable, pluggable terminal, and also a command runner."
arch=("x86_64")
url="https://github.com/CyanSalt/commas"
license=('ISC')
conflicts=("${pkgname}")
depends=(
    'alsa-lib'
    'python'
    'cairo'
    'libxcb'
    'libxkbcommon'
    'gtk3'
    'libxext'
    'libx11'
    'libcups'
    'libxcomposite'
    'libxrandr'
    'libdrm'
    'pango'
    'nss'
    'expat'
    'libxdamage'
    'mesa'
    'libxfixes'
    'nspr'
    'at-spi2-core'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodever}"
    nvm use "${_nodever}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm install
    npm run pack
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}