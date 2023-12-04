# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bluestone
_pkgname=Bluestone
pkgver=0.12.2
pkgrel=1
pkgdesc="A WYSIWYG Markdown editor, improve reading and editing experience."
arch=('x86_64')
url="https://github.com/1943time/bluestone"
license=('AGPL3')
conflicts=("${pkgname}")
depends=(
    'alsa-lib'
    'libxcomposite'
    'cairo'
    'nss'
    'pango'
    'libxcb'
    'mesa'
    'libdrm'
    'libxkbcommon'
    'nspr'
    'gtk3'
    'expat'
    'at-spi2-core'
    'libxrandr'
    'libxdamage'
    'libcups'
    'libx11'
    'libxfixes'
    'libxext'
)
makedepends=(
    'pnpm'
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
    nvm install 18
    nvm use 18
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    sed "s|--arm64 ||g" -i package.json
    sed '/deb/d' -i electron-builder.yml
    pnpm install --no-frozen-lockfile
    pnpm run build
    pnpm run build:linux
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r  "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}