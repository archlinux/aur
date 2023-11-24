# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hugin-messenger
_pkgname="Hugin Messenger"
pkgver=0.4.0
pkgrel=1
pkgdesc="The new version of the private messaging desktop application powered by the Kryptokrona Blockchain."
arch=('x86_64')
url="https://hugin.chat/"
_ghurl="https://github.com/kryptokrona/hugin-desktop"
license=('GPL3')
conflicts=("${pkgname}")
depends=(
    'libcups'
    'libxfixes'
    'at-spi2-core'
    'libxrandr'
    'alsa-lib'
    'libxdamage'
    'libxkbcommon'
    'gtk3'
    'libxcomposite'
    'expat'
    'pango'
    'libxcb'
    'cairo'
    'mesa'
    'nss'
    'libdrm'
    'libxext'
    'libx11'
    'nspr'
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'make'
    'gcc'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
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
    gendesk -f -n -q --categories "Network" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e '/"deb",/d' -e "s|snap|AppImage|g" -i build.config.json
    npm install --quiet --cache "${srcdir}/npm-cache"
    chmod a+x node_modules/cross-env/src/bin/cross-env.js
    npm run build:linux-x64
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}