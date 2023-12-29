# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pear-rec-git
pkgver=1.3.8.r1.ga0486a2
_electronversion=26
pkgrel=1
pkgdesc="An open-source, cross-platform terminal for seamless workflows"
arch=(
    'x86_64'
)
url="https://027xiguapi.github.io/pear-rec/"
_ghurl="https://github.com/027xiguapi/pear-rec"
license=('Apache')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs>=20'
    'git'
    'pnpm'
    'make'
    'gcc'
    'asar'
)
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -f -n -q --categories "Utility" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed "s|release/\${version}|release|g" -i packages/desktop/electron-builder.json5
    sed "s|React, ||g" -i packages/timer/src/useTimer.tsx
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    pnpm install
    pnpm add -w globals
    pnpm add -w tslib
    pnpm run build:screenshot
    pnpm run build:recorder
    pnpm run build:timer
    pnpm run build:docs
    pnpm run build:desktop
    asar e packages/desktop/release/linux-unpacked/resources/app.asar "${srcdir}/app.asar.unpacked"
    sed "s|favicon.ico|favicon.png|g" -i "${srcdir}/app.asar.unpacked/dist-electron/main/index.js"
    cp "${srcdir}/app.asar.unpacked/dist/imgs/logo/logo.png" "${srcdir}/app.asar.unpacked/dist/imgs/logo/favicon.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-git}/packages/desktop/build/icons/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}