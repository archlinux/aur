# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pear-rec
pkgver=1.3.2
_electronversion=26
pkgrel=1
pkgdesc="An open-source, cross-platform terminal for seamless workflows"
arch=(
    'x86_64'
)
url="https://027xiguapi.github.io/pear-rec/"
_ghurl="https://github.com/027xiguapi/pear-rec"
license=('Apache')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs>=20'
    'git'
    'pnpm'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --categories "Utility" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "20i\    icon: 'build/icons/png/1024x1024.png'," -i packages/desktop/electron-builder.json5
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    pnpm install
    pnpm run build:desktop
    sed "s|favicon.ico|favicon.png|g" -i "packages/desktop/release/${pkgver}/linux-unpacked/resources/app/dist-electron/main/index.js"
    cp packages/desktop/build/icons/png/32x32.png "packages/desktop/release/${pkgver}/linux-unpacked/resources/app/dist/imgs/logo/favicon.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/packages/desktop/release/${pkgver}/linux-unpacked/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/desktop/build/icons/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
}