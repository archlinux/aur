# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=manyi-transformer
_pkgname=Manyi-transformer
pkgver=1.2.0
_electronversion=23
_nodeversion=16
pkgrel=4
pkgdesc="A tool for gltf/glb models compression."
arch=('any')
url="https://github.com/MarshallChang/Manyi-transformer"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    'libxdamage'
    'at-spi2-core'
    'dbus'
    'libdrm'
    'pango'
    'libcups'
    'alsa-lib'
    'libxcomposite'
    'libxext'
    'libvips'
    'hicolor-icon-theme'
    'cairo'
    'nspr'
    'python'
    'libxkbcommon'
    'expat'
    'libxcb'
    'nss'
    'libx11'
    'libxfixes'
    'libxrandr'
    'gtk3'
    'mesa'
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
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -f -n -q --categories "Development" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm install --no-package-lock
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/app/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}