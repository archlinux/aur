# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ytdl-desktop
_pkgname="Youtube Downloader Desktop"
pkgver=1.0.0
_electronversion=25
pkgrel=3
pkgdesc="Youtube Downloader Desktop"
arch=('x86_64')
url="https://github.com/kayy0812/ytdl-desktop"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'yarn'
    'nodejs'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'd20ac014ef92dcda76146fa30a2bdd1803f17a350018c59ffec6ad7867947e61')
build() {
    sed -i "s|@electronversion@|${_electronversion}|" "$srcdir/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '23,26d' -i forge.config.js
    yarn config set cache-folder "${srcdir}/yarn_cache"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    yarn install
    yarn package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64//LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}