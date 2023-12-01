# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mkfont
pkgver=1.2.2
_electronversion=24
pkgrel=3
pkgdesc="A free (libre) tool to create & export fonts from existing assets. Component-based workflow, with advanced features to nit-pick & tweak metrics in a non-destructive way!"
arch=('x86_64')
url="https://nebukam.github.io/mkfont/"
_ghurl="https://github.com/Nebukam/mkfont"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'yarn'
    'npm'
    'nodejs'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '6686cb51a19aba9cfe171f55a1451ddc2fcf2687d106eb60348f0f1c89db048a')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    sed "s|@electronversion@|${_electronversion}|" -i "${srcdir}/${pkgname}.sh"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    #Just build linux packages
    sed "36s|true|false|;70s|false|true|" -i nkmjs.config.json
    yarn config set cache-folder "${srcdir}/yarn_cache"
    yarn install
    yarn run nkmjs build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/builds/${pkgver}/desktop/linux-x64-${pkgver}/linux-unpacked/resources/app.asar" \
        -t  "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}