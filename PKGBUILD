# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=akuse
_pkgname=Akuse
pkgver=0.3.3
_electronversion=25
pkgrel=1
pkgdesc="Simple and easy to use anime streaming desktop app without ads."
arch=('any')
url="https://github.com/akuse-app/Akuse"
license=('GPL-3.0-or-later')
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
    "${pkgname}.git::git+${url}.git#tag=${pkgver}"
    "clientData.js"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '091d0d9b3a06579647ed4c1989d7edff13754cec34fcdbb7fbc24529bd01ed48'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed '84,87d;82d' -i package.json
    install -Dm644 "${srcdir}/clientData.js" -t "${srcdir}/${pkgname}.git/src/modules"
    npm install --force
    npm run dist:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/assets/img/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}