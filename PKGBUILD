# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=peershare
pkgver=0.0.9
_electronversion=27
pkgrel=3
pkgdesc="A peer-to-peer file sharing app,enables you to share files to your friends, family, colleagues etc, using peer-to-peer technology."
arch=('any')
url="https://github.com/connor-davis/peershare"
license=('custom:unknown')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
    'git'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --categories "Utility" --name "PeerShare" --exec "${pkgname} %U"
    1cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed 's|"tar.gz"|"AppImage"|g;s|--l --x64 -p always|--l -p never|g' -i package.json
    npm install
    npm run build
    npm run distLinux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}